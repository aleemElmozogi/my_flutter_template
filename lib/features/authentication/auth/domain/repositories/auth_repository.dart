import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/features/authentication/auth/data/models/login_request.dart';
import 'package:my_flutter_template/features/authentication/auth/data/models/user_content_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserContentModel>> signIn(LoginRequest request);
}

