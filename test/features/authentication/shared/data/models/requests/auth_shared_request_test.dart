import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_template/features/authentication/shared/data/models/requests/phone_number_request.dart';
import 'package:my_flutter_template/features/authentication/shared/data/models/requests/verify_otp_request.dart';

void main() {
  group('PhoneNumberRequest', () {
    test('serializes phone number payload', () {
      const request = PhoneNumberRequest(phoneNumber: '0912345678');

      expect(request.toJson(), {'phoneNumber': '0912345678'});
    });
  });

  group('VerifyOtpRequest', () {
    test('serializes OTP verification payload', () {
      const request = VerifyOtpRequest(
        otp: '123456',
        verificationId: 'verification-id',
      );

      expect(request.toJson(), {
        'otp': '123456',
        'verificationId': 'verification-id',
      });
    });
  });
}
