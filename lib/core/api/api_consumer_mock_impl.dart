import 'dart:convert';
import 'dart:io';

import 'package:my_flutter_template/core/api/api_consumer.dart';
import 'package:my_flutter_template/core/api/api_interceptors.dart';
import 'package:my_flutter_template/core/di/injection.dart';
import 'package:my_flutter_template/core/error/exceptions.dart';
import 'package:my_flutter_template/core/models/json_model.dart';
import 'package:my_flutter_template/core/network/netwok_info.dart';
import 'package:my_flutter_template/core/utils/network_method.dart';
import 'package:my_flutter_template/core/di/injection.dart' as di;
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:injectable/injectable.dart';

import 'api_helper.dart';

@mock
@Injectable(as: ApiConsumer)
class DioConsumerMockImpl implements ApiConsumer {
  final Dio client = Dio();
  final NetworkInfo networkInfo;

  DioConsumerMockImpl(this.networkInfo) {
    client.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) {
          return true;
        });
        return client;
      },
    );

    client.interceptors.add(AppInterceptors());
  }

  @override
  Future<T> request<T extends JsonModel>(
    ResponseModelCreator<T> responseCreator, {
    required String path,
    required NetworkMethod method,
    bool formDataIsEnabled = false,
    Map<String, String> header = const {},
    Map<String, dynamic> body = const {},
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> mockResponse = const {},
    String authorization = '',
  }) async {
    if (!await networkInfo.isConnected) {
      throw NoInternetConnectionException();
    }

    try {
      await Future.delayed(const Duration(seconds: 2));
      final response = Response(
          data: jsonEncode(mockResponse),
          requestOptions: RequestOptions(),
          statusCode:
              jsonDecode(jsonEncode(mockResponse))["statusCode"] ?? 200);
      di.getIt<ApiHelper>().handleStatusCodeError(
          jsonDecode(jsonEncode(mockResponse))["statusCode"] ?? 200);
      return di
          .getIt<ApiHelper>()
          .handleResponseAsJson<T>(responseCreator, response);
    } on DioException catch (error) {
      return di.getIt<ApiHelper>().handleDioError(error);
    }
  }
}
