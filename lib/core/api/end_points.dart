import 'package:my_flutter_template/config/env/app_environment.dart';

class EndPoints {
  static const String baseUrl = AppEnvironment.apiBaseUrl;

  static const String signIn = '$baseUrl/api/Auth/SignIn';
  static const String registration = '$baseUrl/api/Auth/Registration';
  static const String refreshToken = '$baseUrl/api/Auth/RefreshToken';
  static const String sendOtp = '$baseUrl/api/Auth/SendOtp';
  static const String verifyOtp = '$baseUrl/api/Auth/VerifyOtp';

  static const String addLike = '$baseUrl/api/UserInterActions/AddLike';

  static const String createProject = '$baseUrl/api/Project/CreateProject';

  static const String donation = '$baseUrl/api/UserInterActions/Donation';

  static const String depositWallet =
      '$baseUrl/api/UserInterActions/DepositWallet';
  static const String checkDepositTransactionStatus =
      '$baseUrl/api/UserInterActions/CheckDepositTransactionStatus';
  static const String getWalletBalance =
      '$baseUrl/api/UserInterActions/GetWalletBalance';
  static const String fetchImpactStatistic =
      '$baseUrl/api/UserInterActions/FetchImpactStatistic';
  static const String fetchProjects = '$baseUrl/api/Project/FetchProjects';
  static const String getCities = '$baseUrl/api/Project/GetCities';

  static const String createPost = '$baseUrl/api/Posts/CreatePost';
  static const String fetchPosts = '$baseUrl/api/Posts/FetchPosts';
  static const String getAreas = '$baseUrl/api/Posts/GetAreas';
}
