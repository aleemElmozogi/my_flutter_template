import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:my_flutter_template/features/authentication/auth/data/models/login_request.dart';
import 'package:my_flutter_template/features/authentication/auth/data/models/user_content_model.dart';
import 'package:my_flutter_template/features/authentication/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AuthUsecase extends UseCase<UserContentModel, LoginRequest> {
  final AuthRepository authRepository;

  AuthUsecase({required this.authRepository, required super.networkInfo});

  @override
  Future<Either<Failure, UserContentModel>> call(LoginRequest params) async {
    return authRepository.signIn(params);
  }
}
