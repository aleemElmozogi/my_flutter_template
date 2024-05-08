import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/exceptions.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/network/netwok_info.dart';
import 'package:my_flutter_template/features/auth/data/datasources/user_info_data_source.dart';
import 'package:my_flutter_template/features/auth/data/models/user_content_model.dart';
import 'package:my_flutter_template/features/auth/domain/repositories/user_info_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: UserInfoRepository)
class UserInfoRepositoryImpl implements UserInfoRepository {
  final NetworkInfo networkInfo;
  final UserInfoDataSource userInfoDataSource;

  UserInfoRepositoryImpl({
    required this.networkInfo,
    required this.userInfoDataSource,
  });
  @override
  Future<Either<Failure, UserContentModel>> fetch() async {
    try {
      if (await networkInfo.isConnected) {
        final response = await userInfoDataSource.fetch();
        return Right(response);
      } else {
        throw  NoInternetConnectionException();
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
