import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:my_flutter_template/core/network/network_info.dart';

typedef UseCaseResponse<T> = Future<Either<Failure, T>>;

abstract class UseCase<Type, Params> {
  final NetworkInfo networkInfo;
  const UseCase({required this.networkInfo});

  UseCaseResponse<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
