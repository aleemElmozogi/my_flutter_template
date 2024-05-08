import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }

}

class ServerFailure extends Failure {
  const ServerFailure([super.message]);
}
class FetchErrorFailure extends Failure {
  const FetchErrorFailure([super.message]);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message]);
}
