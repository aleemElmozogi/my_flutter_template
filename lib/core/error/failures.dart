import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? _message;
  final List<String>? messages;

  const Failure({String? message, this.messages})
      : _message = message,
        super();
  @override
  List<Object?> get props => [_message];

  String? get message => _message ?? messages?.first;

  @override
  String toString() {
    return '$_message';
  }
}

class ServerFailure extends Failure {
  const ServerFailure([String? message, List<String>? messages])
      : super(message: message, messages: messages);
  const ServerFailure.withMessage(String message) : super(message: message);

  const ServerFailure.withMessages(List<String> messages) : super(messages: messages);
}

class FetchErrorFailure extends Failure {
  const FetchErrorFailure([String? message, List<String>? messages])
      : super(message: message, messages: messages);
  const FetchErrorFailure.withMessage(String message) : super(message: message);

  const FetchErrorFailure.withMessages(List<String> messages)
      : super(messages: messages);
}

class CacheFailure extends Failure {
  const CacheFailure([String? message, List<String>? messages])
      : super(message: message, messages: messages);
  const CacheFailure.withMessage(String message) : super(message: message);

  const CacheFailure.withMessages(List<String> messages) : super(messages: messages);
}

class NetworkFailure extends Failure {
  const NetworkFailure([String? message, List<String>? messages])
      : super(message: message, messages: messages);
  const NetworkFailure.withMessage(String message) : super(message: message);

  const NetworkFailure.withMessages(List<String> messages)
      : super(messages: messages);
}

class AuthFailure extends Failure {
  const AuthFailure([String? message, List<String>? messages])
      : super(message: message, messages: messages);
  const AuthFailure.withMessage(String message) : super(message: message);

  const AuthFailure.withMessages(List<String> messages) : super(messages: messages);

  factory AuthFailure.fromError(dynamic error) {
    if (error is String) {
      return AuthFailure.withMessage(error);
    } else if (error is List<dynamic>) {
      return AuthFailure.withMessages(error.map((e) => e.toString()).toList());
    } else {
      return AuthFailure.withMessage(error.toString());
    }
  }
}

class ApiFailure extends Failure {
  const ApiFailure([String? message, List<String>? messages])
      : super(message: message, messages: messages);
  const ApiFailure.withMessage(String message) : super(message: message);

  const ApiFailure.withMessages(List<String> messages) : super(messages: messages);

  factory ApiFailure.fromError(dynamic error) {
    if (error is String) {
      return ApiFailure.withMessage(error);
    } else if (error is List<dynamic>) {
      return ApiFailure.withMessages(error.map((e) => e.toString()).toList());
    } else {
      return ApiFailure.withMessage(error.toString());
    }
  }
}
