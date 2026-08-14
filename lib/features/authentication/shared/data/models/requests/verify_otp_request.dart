import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp_request.g.dart';

@JsonSerializable(createFactory: false)
class VerifyOtpRequest {
  final String otp;
  final String verificationId;

  VerifyOtpRequest({required this.otp, required this.verificationId});

  Map<String, dynamic> toJson() => _$VerifyOtpRequestToJson(this);
}
