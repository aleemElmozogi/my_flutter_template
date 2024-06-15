import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:my_flutter_template/core/api/status_code.dart';
import 'package:my_flutter_template/core/error/exceptions.dart';
import 'package:my_flutter_template/core/models/error_response_model.dart';
import 'package:my_flutter_template/core/models/json_model.dart';
import 'package:my_flutter_template/core/models/response_model.dart';
import 'package:injectable/injectable.dart';

import 'api_consumer.dart';

abstract class ApiHelper {
  T handleResponseAsJson<T extends JsonModel>(
      ResponseModelCreator<T> responseCreator, Response<String> response);
  dynamic handleDioError(DioException error);
  dynamic handleStatusCodeError(int statusCode);
}

@LazySingleton(as: ApiHelper)
class ApiHelperImpl implements ApiHelper {
  @override
  dynamic handleStatusCodeError(int statusCode) {
    switch (statusCode) {
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
  }



  @override
  dynamic handleDioError(DioException error) {
    try {
      _handleBackEndError(error.response);
    } catch (e) {
      // Rethrow the exception to prevent execution of the switch statement
      rethrow;
    }
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw FetchDataException();
      case DioExceptionType.badResponse:
        handleStatusCodeError(error.response?.statusCode ?? 200);
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
    ResponseModelCreator<T> responseCreator,
    Response<String> response,
  ) {
    var parsedResponse = responseCreator() as ResponseModel;
    try {
      final messageResponse = jsonDecode(response.data!);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        // Handle success response
        parsedResponse = parsedResponse.fromJson(messageResponse);
        return parsedResponse as T;
      } else {
        // Handle error response
        _handleBackEndError(response);
        // Since _handleBackEndError will throw an exception, the next line is unreachable.
        // However, Dart requires a return statement to satisfy the return type.
        throw FetchDataException(); // or any default error handling
      }
    } catch (e) {
      throw BadResponseException(e.toString());
    }
  }


  dynamic _handleBackEndError(Response<dynamic>? response) {
    if (response != null) {
      try{
        final decodedResponse = jsonDecode(response.data!);
        final errorResponse = ErrorResponseModel.fromJson(decodedResponse);
        throw ApiException(errorResponse);
      }on Exception catch(e){
        throw FetchDataException();
      }

    }
  }
}
