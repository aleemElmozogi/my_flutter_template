import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/features/authentication/shared/data/models/requests/phone_number_request.dart';
import 'package:my_flutter_template/features/authentication/shared/data/models/requests/verify_otp_request.dart';

abstract class AuthSharedRepository {
  Future<Either<Failure, String>> sendOtp(PhoneNumberRequest request);
  Future<Either<Failure, void>> verifyOtp(VerifyOtpRequest request);
  // Future<Either<Failure, List<CityContentModel>>> fetchCities();
  // Future<Either<Failure, List<CityCircleContentModel>>> fetchCityCircles(
  //   FetchCircleRequest request,
  // );
  // Future<Either<Failure, StudentInfoContentModel>> fetchStudentInfo(
  //   PhoneNumberRequest request,
  // );
}
