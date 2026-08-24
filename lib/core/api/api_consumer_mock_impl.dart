import 'dart:convert';

import 'package:my_flutter_template/core/api/api_consumer.dart';
import 'package:my_flutter_template/core/api/api_interceptors.dart';
import 'package:my_flutter_template/core/di/injection.dart';
import 'package:my_flutter_template/core/error/exceptions.dart';
import 'package:my_flutter_template/core/models/json_model.dart';
import 'package:my_flutter_template/core/network/network_info.dart';
import 'package:my_flutter_template/core/utils/network_method.dart';
import 'package:my_flutter_template/core/di/injection.dart' as di;
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'api_helper.dart';

@mock
@Singleton(as: ApiConsumer, order: -1)
class DioConsumerMockImpl implements ApiConsumer {
  final Dio client = Dio();
  final NetworkInfo networkInfo;

  DioConsumerMockImpl(this.networkInfo) {
    client.interceptors.add(AppInterceptors(client));
  }

  @override
  Future<T> request<T extends JsonModel<dynamic>>(
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
      await Future<void>.delayed(const Duration(seconds: 2));
      final statusCode =
          jsonDecode(jsonEncode(mockResponse))["statusCode"] as int? ?? 200;
      final response = Response<String>(
        data: jsonEncode(mockResponse),
        statusCode: statusCode,
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
