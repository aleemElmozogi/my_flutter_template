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
@Singleton(as: ApiConsumer, order: -1)
class DioConsumerMockImpl implements ApiConsumer {
  final Dio client = Dio();
  final NetworkInfo networkInfo;

  DioConsumerMockImpl(this.networkInfo) {
    client.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client = HttpClient(
          context: SecurityContext(withTrustedRoots: false),
        );
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
      final encodedResponse = jsonEncode(mockResponse);
      final decodedResponse =
      jsonDecode(encodedResponse) as Map<String, dynamic>;
      final response = Response<String>(
        data: encodedResponse,
        statusCode: decodedResponse['statusCode'] as int? ?? 200,
        requestOptions: RequestOptions(),
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
}
