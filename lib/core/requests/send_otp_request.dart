class SendOtpRequest {
  String phoneNumber;
  void Function(String verificationId) onCodeSent;
  void Function(String exception) onCodeSentFailed;

  SendOtpRequest({
    required this.phoneNumber,
    required this.onCodeSent,
    required this.onCodeSentFailed,
  });
}
