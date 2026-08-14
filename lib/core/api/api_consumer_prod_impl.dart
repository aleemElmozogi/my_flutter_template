import 'dart:io';

import 'package:my_flutter_template/core/api/api_consumer.dart';
import 'package:my_flutter_template/core/api/api_interceptors.dart';
import 'package:my_flutter_template/core/api/end_points.dart';
import 'package:my_flutter_template/core/api/status_code.dart';
import 'package:my_flutter_template/core/error/exceptions.dart';
import 'package:my_flutter_template/core/models/json_model.dart';
import 'package:my_flutter_template/core/network/netwok_info.dart';
import 'package:my_flutter_template/core/utils/network_method.dart';
import 'package:my_flutter_template/core/di/injection.dart' as di;
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_helper.dart';

@prod
@Singleton(as: ApiConsumer, order: -1)
class DioConsumerProdImpl implements ApiConsumer {
  final Dio client = Dio();
  final NetworkInfo networkInfo;

  DioConsumerProdImpl(this.networkInfo) {
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..connectTimeout = const Duration(seconds: 60)
      ..receiveTimeout = const Duration(seconds: 60)
      ..sendTimeout = const Duration(seconds: 60)
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    client.interceptors.add(AppInterceptors());
  }

  @override
  Future<T> request<T extends JsonModel>(
      ResponseModelCreator<T> responseCreator, {
        required String path,
        required NetworkMethod method,
        Map<String, String> header = const {},
        Map<String, dynamic> body = const {},
        Map<String, dynamic> queryParameters = const {},
        Map<String, dynamic> mockResponse = const {},
        String authorization = '',
      }) async {
    if (!await networkInfo.isConnected) {
      throw NoInternetConnectionException();
    }
    client.options = _configureDioOptions(method, authorization, header);
    try {
      final response = await client.request<String>(
        path,
        queryParameters: Map<String, dynamic>.from(queryParameters)
          ..removeWhere((key, value) => value == null),
        data: method == NetworkMethod.multipart
            ? FormData.fromMap(body)
            : (Map<String, dynamic>.from(body)
          ..removeWhere((key, value) => value == null)),
      );
      return di.getIt<ApiHelper>().handleResponseAsJson<T>(
        responseCreator,
        response,
      );
    } on ApiException {
      rethrow;
    } on DioException catch (error) {
      di.getIt<ApiHelper>().handleDioError(error);
      rethrow;
    } on Exception {
      di.getIt<ApiHelper>().handleDioError(
        DioException(requestOptions: RequestOptions()),
      );
      rethrow;
    }
  }

  BaseOptions _configureDioOptions(
      NetworkMethod method,
      String authorization,
      Map<String, String> header,
      ) => BaseOptions(
    method: method.key,
    sendTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
    headers: _handleHttpHeader(
      method: method,
      authorization: authorization,
      header: header,
    ),
  );

  Map<String, String> _handleHttpHeader({
    required NetworkMethod method,
    required String authorization,
    required Map<String, String> header,
  }) {
    final contentType = method == NetworkMethod.multipart
        ? 'multipart/form-data'
        : 'application/json';

    final headers = {
      HttpHeaders.contentTypeHeader: contentType,
      if (authorization.isNotEmpty)
        HttpHeaders.authorizationHeader: 'Bearer $authorization',
      ...header,
    };

    return headers;
  }
}
