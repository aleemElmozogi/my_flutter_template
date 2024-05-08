import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:equatable/equatable.dart';

typedef UseCaseResponse<T> = Future<Either<Failure, T>>;

abstract class UseCase<Type, Params> {

  UseCaseResponse<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
