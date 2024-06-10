import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:my_flutter_template/core/api/status_code.dart';
import 'package:my_flutter_template/core/error/exceptions.dart';
import 'package:my_flutter_template/core/models/json_model.dart';
import 'package:my_flutter_template/core/models/response_model.dart';
import 'package:injectable/injectable.dart';

import 'api_consumer.dart';

abstract class ApiHelper {
  T handleResponseAsJson<T extends JsonModel>(
      ResponseModelCreator<T> responseCreator, Response<String> response);
  dynamic handleDioError(DioException error);
}

@LazySingleton(as: ApiHelper)
class ApiHelperImpl implements ApiHelper {
  @override
  dynamic handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
          case StatusCode.fulfilledRequest:
            throw BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw UnauthorizedException();
          case StatusCode.notFound:
          case StatusCode.redirectError:
            throw NotFoundException();
          case StatusCode.conflict:
            throw ConflictException();
          case StatusCode.invalidMethod:
            throw BadRequestException();
          case StatusCode.internalServerError:
          case StatusCode.serverFileConflict:
            throw InternalServerErrorException();
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw NoInternetConnectionException();
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioExceptionType.connectionError:
        throw NoInternetConnectionException();
    }
  }

  @override
  T handleResponseAsJson<T extends JsonModel>(
      ResponseModelCreator<T> responseCreator, Response<String> response) {
    var parsedResponse = responseCreator() as ResponseModel;
    try {
      final messageResponse = jsonDecode(response.data!);
      parsedResponse = parsedResponse.fromJson(messageResponse);
      return parsedResponse as T;
    } catch (e) {
      throw BadResponseException(e.toString());
    }
  }
}
