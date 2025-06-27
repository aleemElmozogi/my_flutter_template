class VerifyOtpRequest {
  final String otp;
  final String verificationId;

  VerifyOtpRequest({
    required this.otp,
    required this.verificationId,
  });
}
