class EndPoints {
  static const bool isMock = false;
  static const String baseUrl = 'http://localhost:5068/v1.0';
  static const String signIn = '$baseUrl/consumer/Auth/SignIn';
  static const String registration = '$baseUrl/consumer/Auth/Registration';
  static const String forgetPassword = '$baseUrl/api/Auth/forgetPassword';
  static const String sentOtp = '$baseUrl/api/Auth/sendOtp';
  static const String verifyOtp = '$baseUrl/api/Auth/VerifyOtpRequest';
}
