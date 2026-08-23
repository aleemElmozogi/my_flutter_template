import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:my_flutter_template/features/authentication/shared/data/models/requests/verify_otp_request.dart';
import 'package:my_flutter_template/features/authentication/shared/domain/repositories/auth_shared_repository.dart';

@lazySingleton
class VerifyOtpUsecase extends UseCase<void, VerifyOtpRequest> {
  VerifyOtpUsecase({required this.repository, required super.networkInfo});

  final AuthSharedRepository repository;

  @override
  UseCaseResponse<void> call(VerifyOtpRequest params) {
    return repository.verifyOtp(params);
  }
}
