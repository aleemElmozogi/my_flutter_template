import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/exceptions.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/network/netwok_info.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/features/authentication/auth/data/datasources/auth_data_source.dart';
import 'package:my_flutter_template/features/authentication/auth/domain/repositories/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({
    required this.networkInfo,
    required this.authDataSource,
  });
  @override
  Future<Either<Failure, String>> auth(userDto) async {
    try {
      if (await networkInfo.isConnected) {
        final response = await authDataSource.auth(userDto);
        return Right(response);
      } else {
        throw NoInternetConnectionException();
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on Exception catch (e) {
      return const Left(CacheFailure());
    }
  }
}
