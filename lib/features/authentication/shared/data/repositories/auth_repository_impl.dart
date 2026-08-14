import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/core/api/end_points.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/models/message_model.dart';
import 'package:my_flutter_template/features/authentication/auth/data/models/login_request.dart';
import 'package:my_flutter_template/core/utils/network_method.dart';
import 'package:my_flutter_template/data/repositories/base_repository.dart';
import 'package:my_flutter_template/features/authentication/auth/data/models/credentials_model.dart';
import 'package:my_flutter_template/features/authentication/auth/data/models/user_content_model.dart';
import 'package:my_flutter_template/features/authentication/auth/domain/repositories/auth_repository.dart';
import 'package:my_flutter_template/features/authentication/shared/data/models/requests/phone_number_request.dart';
import 'package:my_flutter_template/features/authentication/shared/data/models/requests/verify_otp_request.dart';
import 'package:my_flutter_template/features/authentication/shared/domain/repositories/auth_shared_repository.dart';
import 'package:my_flutter_template/generated/l10n.dart';

@LazySingleton()
class AuthRepositoryImpl extends BaseRepository
    implements AuthRepository, AuthSharedRepository {
  AuthRepositoryImpl({
    required super.localStorage,
    required super.apiConsumer,
    required super.networkInfo,
  });

  @override
  Future<Either<Failure, UserContentModel>> signIn(LoginRequest request) async {
    return executeRequest<CredentialsModel, UserContentModel>(
      requestFunction: () async => apiConsumer.request<CredentialsModel>(
        CredentialsModel.new,
        path: EndPoints.signIn,
        method: NetworkMethod.post,
        body: request.toJson(),
        authorization: await localStorage.publicToken,
        mockResponse: {
          "statusCode": 200,
          "data": {
            "accessToken": "accessToken",
            "refreshToken": "refreshToken",
            "accountState": "active",
            "userProfile": {
              'fullName': 'عبدالعليم فوزي المزوغي',
              'email': 'user@kuttab.app',
              'imageUrl':
                  'https://gravatar.com/avatar/16da400a4fdcc3086142b7af28655b3e?s=400&d=robohash&r=x',
              'phoneNumber': "+218924397976",
              "role": 3,
            },
          },
        },
      ),
      onSuccess: (credentials) async {
        final accessToken = credentials.data?.accessToken ?? '';
        final refreshToken = credentials.data?.refreshToken ?? '';
        final user = credentials.data?.user;
        final accountState = credentials.data?.accountState;

        if (accountState == null) {
          throw FetchErrorFailure.withMessage(S.current.missingAccountState);
        }
        if (accountState.isResetPassword) {
          throw ResetPasswordRequiredFailure.withMessage(
            S.current.passwordResetRequired,
          );
        }
        if (!accountState.isActive) {
          throw InactiveAccountFailure.withMessage(S.current.accountNotActive);
        }
        if (user == null) {
          throw FetchErrorFailure.withMessage(S.current.missingUserProfile);
        }

        // await localStorage.appStarted();
        // await localStorage.refreshAccessToken(accessToken);
        // await localStorage.refreshRefreshTokenToken(refreshToken);
        // await localStorage.saveLoggedUser(
        //   role: user.role,
        //   name: user.fullName,
        //   phone: user.phoneNumber,
        // );

        return user;
      },
    );
  }

  // @override
  // Future<Either<Failure, String>> signUp(SignupRequest request) async {
  //   return executeMessageRequest(
  //     requestFunction: () async => apiConsumer.request<MessageModel>(
  //       MessageModel.new,
  //       path: EndPoints.registration,
  //       method: NetworkMethod.multipart,
  //       body: {
  //         ...request.toJson(),
  //         if (request.imagePath != null)
  //           "Image": await MultipartFile.fromFile(
  //             request.imagePath!,
  //             filename: "pfp.png",
  //           ),
  //       },
  //       authorization: await localStorage.publicToken,
  //       mockResponse: {"statusCode": 200, "data": 'secsuss'},
  //     ),
  //   );
  // }
  //
  @override
  Future<Either<Failure, String>> sendOtp(PhoneNumberRequest request) {
    return executeMessageRequest(
      requestFunction: () async => apiConsumer.request<MessageModel>(
        MessageModel.new,
        path: EndPoints.sentOtp,
        method: NetworkMethod.post,
        body: request.toJson(),
        authorization: await localStorage.publicToken,
        mockResponse: {"statusCode": 200, "data": 'secsuss'},
      ),
    );
  }

  @override
  Future<Either<Failure, void>> verifyOtp(VerifyOtpRequest request) {
    return executeVoidMessageRequest(
      requestFunction: () async => apiConsumer.request<MessageModel>(
        MessageModel.new,
        path: EndPoints.verifyOtp,
        method: NetworkMethod.post,
        body: request.toJson(),
        authorization: await localStorage.publicToken,
        mockResponse: {"statusCode": 200, "data": 'secsuss'},
      ),
    );
  }

  // @override
  // Future<Either<Failure, void>> forgetPassword(ForgetPasswordRequest request) {
  //   return executeVoidMessageRequest(
  //     requestFunction: () async => apiConsumer.request<MessageModel>(
  //       MessageModel.new,
  //       path: EndPoints.forgetPassword,
  //       method: NetworkMethod.post,
  //       body: request.toJson(),
  //       authorization: await localStorage.publicToken,
  //       mockResponse: {"statusCode": 200, "data": 'secsuss'},
  //     ),
  //   );
  // }

  // @override
  // Future<Either<Failure, StudentInfoContentModel>> fetchStudentInfo(
  //   PhoneNumberRequest request,
  // ) {
  //   return executeRequest<StudentInfoModel, StudentInfoContentModel>(
  //     requestFunction: () async => apiConsumer.request<StudentInfoModel>(
  //       StudentInfoModel.new,
  //       path: EndPoints.fetchStudentInfo,
  //       method: NetworkMethod.post,
  //       body: request.toJson(),
  //       authorization: await localStorage.publicToken,
  //       mockResponse: {
  //         "statusCode": 200,
  //         "data": {
  //           "studentId": "student_123",
  //           "fullName": "عبدالعليم فوزي المزوغي",
  //           "circleCode": "CT-12990",
  //           "studentCode": "ST-12990",
  //           "phoneNumber": "913214272",
  //         },
  //       },
  //     ),
  //     onSuccess: (response) async {
  //       return response.data!;
  //     },
  //   );
  // }
}
