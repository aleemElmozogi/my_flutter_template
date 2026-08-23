import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:my_flutter_template/features/authentication/shared/data/models/requests/phone_number_request.dart';
import 'package:my_flutter_template/features/authentication/shared/domain/repositories/auth_shared_repository.dart';

@lazySingleton
class SendOtpUsecase extends UseCase<String, PhoneNumberRequest> {
  SendOtpUsecase({required this.repository, required super.networkInfo});

  final AuthSharedRepository repository;

  @override
  UseCaseResponse<String> call(PhoneNumberRequest params) {
    return repository.sendOtp(params);
  }
}
