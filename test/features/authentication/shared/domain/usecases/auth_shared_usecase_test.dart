import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/network/network_info.dart';
import 'package:my_flutter_template/features/authentication/shared/data/models/requests/phone_number_request.dart';
import 'package:my_flutter_template/features/authentication/shared/data/models/requests/verify_otp_request.dart';
import 'package:my_flutter_template/features/authentication/shared/domain/repositories/auth_shared_repository.dart';
import 'package:my_flutter_template/features/authentication/shared/domain/usecases/send_otp_usecase.dart';
import 'package:my_flutter_template/features/authentication/shared/domain/usecases/verify_otp_usecase.dart';

void main() {
  group('SendOtpUsecase', () {
    test('delegates to AuthSharedRepository.sendOtp', () async {
      final repository = _FakeAuthSharedRepository();
      final usecase = SendOtpUsecase(
        repository: repository,
        networkInfo: _AlwaysConnectedNetworkInfo(),
      );
      const request = PhoneNumberRequest(phoneNumber: '0912345678');

      final result = await usecase(request);

      expect(result, const Right<Failure, String>('sent'));
      expect(repository.sentPhoneRequest, same(request));
    });
  });

  group('VerifyOtpUsecase', () {
    test('delegates to AuthSharedRepository.verifyOtp', () async {
      final repository = _FakeAuthSharedRepository();
      final usecase = VerifyOtpUsecase(
        repository: repository,
        networkInfo: _AlwaysConnectedNetworkInfo(),
      );
      const request = VerifyOtpRequest(
        otp: '123456',
        verificationId: 'verification-id',
      );

      final result = await usecase(request);

      expect(result, const Right<Failure, void>(null));
      expect(repository.verifiedOtpRequest, same(request));
    });
  });
}

class _FakeAuthSharedRepository implements AuthSharedRepository {
  PhoneNumberRequest? sentPhoneRequest;
  VerifyOtpRequest? verifiedOtpRequest;

  @override
  Future<Either<Failure, String>> sendOtp(PhoneNumberRequest request) async {
    sentPhoneRequest = request;
    return const Right('sent');
  }

  @override
  Future<Either<Failure, void>> verifyOtp(VerifyOtpRequest request) async {
    verifiedOtpRequest = request;
    return const Right(null);
  }
}

class _AlwaysConnectedNetworkInfo implements NetworkInfo {
  @override
  Future<bool> get isConnected async => true;
}
