import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/features/auth/data/models/user_content_model.dart';

abstract class UserInfoRepository {
  Future<Either<Failure, UserContentModel>> fetch();
}
