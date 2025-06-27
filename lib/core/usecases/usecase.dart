import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/exceptions.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:my_flutter_template/core/network/network_info.dart';

typedef UseCaseResponse<T> = Future<Either<Failure, T>>;

class UseCase<Type, Params> {
  final NetworkInfo networkInfo;
  UseCase({required this.networkInfo});

  UseCaseResponse<Type> call(Params params) async {
    late final Either<Failure, Type> result;
    try {
      // if (await networkInfo.isConnected) {
      if (true) {
        result = await call(params);
      } else {
        throw NoInternetConnectionException();
      }
    } on ApiException catch (e) {
      return Left(ApiFailure(e.toString()));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on Exception catch (e) {
      return Left(FetchErrorFailure(e.toString()));
    } catch (e) {
      return Left(FetchErrorFailure(e.toString()));
    }

    return result;
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
