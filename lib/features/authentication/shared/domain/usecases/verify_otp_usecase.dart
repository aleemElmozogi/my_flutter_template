import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:my_flutter_template/features/authentication/shared/data/models/requests/verify_otp_request.dart';

import '../repositories/auth_shared_repository.dart';

@Injectable()
class VerifyOtpUsecase extends UseCase<void, VerifyOtpRequest> {
  VerifyOtpUsecase({required this.repository, required super.networkInfo});

  final AuthSharedRepository repository;

  @override
  UseCaseResponse<void> call(VerifyOtpRequest params) async {
    return repository.verifyOtp(params);
  }
}
