import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:my_flutter_template/features/auth/config/dto/user_auth_dto.dart';
import 'package:my_flutter_template/features/auth/domain/entities/user_auth_entity.dart';
import 'package:my_flutter_template/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthUsecase implements UseCase<String, UserAuthEntity> {
  final AuthRepository authRepository;

  AuthUsecase({required this.authRepository});

  @override
  Future<Either<Failure, String>> call(UserAuthEntity params) async =>
      await authRepository
          .auth(UserAuthDto(email: params.email, pin: params.pin));
}
