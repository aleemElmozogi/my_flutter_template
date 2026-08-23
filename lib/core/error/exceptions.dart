import 'package:equatable/equatable.dart';
import 'package:my_flutter_template/core/models/error_response_model.dart';
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
  FetchDataException([Object? message])
    : super(
        (message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.errorDuringCommunication,
      );
}

class EmptyResponseException extends ServerException {
  EmptyResponseException([Object? message])
    : super(
        (message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.noDataOrContentAvailable,
      );
}

class BadRequestException extends ServerException {
  BadRequestException([Object? message])
    : super(
        (message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.invalidRequest,
      );
}

class BadResponseException extends ServerException {
  BadResponseException([Object? message])
    : super(
        (message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.invalidResponse,
      );
}

class UnauthorizedException extends ServerException {
  UnauthorizedException([Object? message])
    : super(
        (message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.unauthorized,
      );
}

class NotFoundException extends ServerException {
  NotFoundException([Object? message])
    : super(
        (message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.informationNotAvailable,
      );
}

class ConflictException extends ServerException {
  ConflictException([Object? message])
    : super(
        (message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.conflictOccurred,
      );
}

class InternalServerErrorException extends ServerException {
  InternalServerErrorException([Object? message])
    : super(
        (message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.internalServerError,
      );
}

class NoInternetConnectionException extends ServerException {
  NoInternetConnectionException([Object? message])
    : super(
        (message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.noInternetConnection,
      );
}

class CacheException extends ServerException {
  CacheException([Object? message])
    : super(
        (message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.noDataOrContentAvailable,
      );
}
