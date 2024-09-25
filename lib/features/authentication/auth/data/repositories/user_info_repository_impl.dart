import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/exceptions.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/network/netwok_info.dart';

import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/features/authentication/auth/data/datasources/user_info_data_source.dart';
import 'package:my_flutter_template/features/authentication/auth/data/models/user_content_model.dart';
import 'package:my_flutter_template/features/authentication/auth/domain/repositories/user_info_repository.dart';

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
    final response = await userInfoDataSource.fetch();
    return Right(response);
  }
}
