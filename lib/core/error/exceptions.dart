import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:my_flutter_template/core/models/error_response_model.dart';
import 'package:my_flutter_template/core/utils/error_fromatter.dart';

class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class ApiException extends ServerException {
  final ErrorResponseModel errorResponse;

  ApiException(this.errorResponse, [String? message])
      : super(message ?? errorResponse.message);

  @override
  List<Object?> get props => [errorResponse, message];

  @override
  String toString() {
    return '${errorResponse.message}${DetailsModel.fromJson(errorResponse.details!.toJson()).errors?.formatErrors}';
  }
}

class FetchDataException extends ServerException {
  FetchDataException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : "خطأ أثناء التواصل");
}

class EmptyResponseException extends ServerException {
  EmptyResponseException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : "لا يوجد بيانات أو محتوى متاح");
}

class BadRequestException extends ServerException {
  BadRequestException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : "طلب غير صالح");
}

class BadResponseException extends ServerException {
  BadResponseException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : "استجابة غير صالحة");
}

class UnauthorizedException extends ServerException {
  UnauthorizedException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : "غير مصرح به");
}

class NotFoundException extends ServerException {
  NotFoundException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : "المعلومات المطلوبة غير موجودة");
}

class ConflictException extends ServerException {
  ConflictException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : "حدث تضارب");
}

class InternalServerErrorException extends ServerException {
  InternalServerErrorException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : "خطأ داخلي في الخادم");
}

class NoInternetConnectionException extends ServerException {
  NoInternetConnectionException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : "لا يوجد اتصال بالإنترنت");
}

class CacheException extends ServerException {
  CacheException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : "لا يوجد بيانات أو محتوى متاح");
}
