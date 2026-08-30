import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_flutter_template/config/env/app_environment.dart';
import 'package:my_flutter_template/core/api/api_helper.dart';
import 'package:my_flutter_template/core/api/api_transport_security.dart';
import 'package:my_flutter_template/core/api/end_points.dart';
import 'package:my_flutter_template/core/api/status_code.dart';
import 'package:my_flutter_template/core/di/injection.dart' as di;
import 'package:my_flutter_template/core/localStorage/loacal_storage.dart';
import 'package:my_flutter_template/features/authentication/auth/data/models/credentials_model.dart';
import 'package:my_flutter_template/features/authentication/auth/presentation/cubit/auth_cubit.dart';

class AppInterceptors extends Interceptor {
  AppInterceptors(this._client);

  final Dio _client;
  Future<bool>? _refreshTokenRequest;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    if (statusCode == StatusCode.unauthorized && !_isRefreshAttempt(err)) {
      final refreshed = await _refreshAccessToken();
      if (refreshed) {
        try {
          final response = await _retry(err.requestOptions);
          return handler.resolve(response);
        } on DioException catch (retryError) {
          return handler.next(retryError);
        }
      }

      await _forceLogout();
    }

    if (statusCode == StatusCode.forbidden) {
      await _forceLogout();
    }

    super.onError(err, handler);
  }

  bool _isRefreshAttempt(DioException err) {
    return err.requestOptions.path == EndPoints.refreshToken ||
        err.requestOptions.extra['retriedAfterRefresh'] == true;
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final accessToken = await di.getIt<LocalStorage>().accessToken;
    final headers = Map<String, dynamic>.from(requestOptions.headers)
      ..[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
    final retryOptions = requestOptions.copyWith(
      headers: headers,
      extra: {...requestOptions.extra, 'retriedAfterRefresh': true},
    );
    return _client.fetch<dynamic>(retryOptions);
  }

  Future<bool> _refreshAccessToken() {
    final currentRequest = _refreshTokenRequest;
    if (currentRequest != null) {
      return currentRequest;
    }

    final request = _requestNewToken();
    _refreshTokenRequest = request;
    return request.whenComplete(() {
      _refreshTokenRequest = null;
    });
  }

  Future<bool> _requestNewToken() async {
    try {
      final localStorage = di.getIt<LocalStorage>();
      final refreshToken = await localStorage.refreshToken;
      if (refreshToken.isEmpty) {
        return false;
      }

      final refreshClient = Dio(
        BaseOptions(
          responseType: ResponseType.plain,
          validateStatus: (status) =>
              status != null && status < StatusCode.internalServerError,
        ),
      );
      refreshClient.httpClientAdapter = ApiTransportSecurity.createAdapter(
        baseUrl: EndPoints.baseUrl,
        allowedSpkiSha256Pins: AppEnvironment.apiSpkiSha256Pins,
      );

      final response = await refreshClient.post<String>(
        EndPoints.refreshToken,
        data: {'refreshToken': refreshToken},
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader:
                'Bearer ${await localStorage.accessToken}',
          },
        ),
      );

      if (response.statusCode == StatusCode.unauthorized ||
          response.statusCode == StatusCode.forbidden) {
        return false;
      }

      final credentials = di.getIt<ApiHelper>().handleResponseAsJson(
        CredentialsModel.new,
        response,
      );
      final accessToken = credentials.data?.accessToken ?? '';
      final newRefreshToken = credentials.data?.refreshToken ?? refreshToken;
      if (accessToken.isEmpty) {
        return false;
      }

      await localStorage.refreshAccessToken(accessToken);
      await localStorage.refreshRefreshTokenToken(newRefreshToken);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> _forceLogout() async {
    if (di.getIt.isRegistered<AuthCubit>()) {
      await di.getIt<AuthCubit>().onForceLogout();
    }
  }
}
