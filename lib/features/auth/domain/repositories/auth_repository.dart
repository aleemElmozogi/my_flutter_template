import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/features/auth/config/dto/user_auth_dto.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> auth(UserAuthDto userAuthDto);
}
