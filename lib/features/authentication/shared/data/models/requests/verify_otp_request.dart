import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_request.g.dart';

@JsonSerializable(createFactory: false)
class VerifyOtpRequest {
  const VerifyOtpRequest({required this.otp, required this.verificationId});

  final String otp;
  final String verificationId;

  Map<String, dynamic> toJson() => _$VerifyOtpRequestToJson(this);
}
