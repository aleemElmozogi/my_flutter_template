import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/network/netwok_info.dart';
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:my_flutter_template/features/authentication/auth/config/dto/user_auth_dto.dart';
import 'package:my_flutter_template/features/authentication/auth/domain/entities/user_auth_entity.dart';
import 'package:my_flutter_template/features/authentication/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthUsecase extends UseCase<String, UserAuthEntity> {
  final AuthRepository authRepository;

  AuthUsecase({required this.authRepository, required NetworkInfo networkInfo})
      : super(networkInfo: networkInfo);

  @override
  Future<Either<Failure, String>> call(UserAuthEntity params) async =>
      await authRepository
          .auth(UserAuthDto(email: params.email, pin: params.pin));
}
