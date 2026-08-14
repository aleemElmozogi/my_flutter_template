import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:my_flutter_template/core/models/error_response_model.dart';
import 'package:my_flutter_template/core/utils/error_fromatter.dart';
import 'package:my_flutter_template/generated/l10n.dart';


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
}

class FetchDataException extends ServerException {
  FetchDataException([String? message])
      : super(
    _resolveExceptionMessage(message, S.current.errorDuringCommunication),
  );
}

class EmptyResponseException extends ServerException {
  EmptyResponseException([String? message])
      : super(
    _resolveExceptionMessage(message, S.current.noDataOrContentAvailable),
  );
}

class BadRequestException extends ServerException {
  BadRequestException([String? message])
      : super(_resolveExceptionMessage(message, S.current.invalidRequest));
}

class BadResponseException extends ServerException {
  BadResponseException([String? message])
      : super(_resolveExceptionMessage(message, S.current.invalidResponse));
}

class UnauthorizedException extends ServerException {
  UnauthorizedException([String? message])
      : super(_resolveExceptionMessage(message, S.current.unauthorized));
}

class NotFoundException extends ServerException {
  NotFoundException([String? message])
      : super(
    _resolveExceptionMessage(message, S.current.informationNotAvailable),
  );
}

class ConflictException extends ServerException {
  ConflictException([String? message])
      : super(_resolveExceptionMessage(message, S.current.conflictOccurred));
}

class InternalServerErrorException extends ServerException {
  InternalServerErrorException([String? message])
      : super(_resolveExceptionMessage(message, S.current.internalServerError));
}

class NoInternetConnectionException extends ServerException {
  NoInternetConnectionException([String? message])
      : super(_resolveExceptionMessage(message, S.current.noInternetConnection));
}

class CacheException extends ServerException {
  CacheException([String? message])
      : super(
    _resolveExceptionMessage(message, S.current.noDataOrContentAvailable),
  );
}

String _resolveExceptionMessage(String? message, String fallback) {
  if (message != null && message.trim().isNotEmpty) {
    return message;
  }
  return fallback;
}