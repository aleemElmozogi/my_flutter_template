import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_flutter_template/core/api/api_consumer.dart';
import 'package:my_flutter_template/core/api/end_points.dart';
import 'package:my_flutter_template/core/error/exceptions.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/localStorage/loacal_storage.dart';
import 'package:my_flutter_template/core/models/message_model.dart';
import 'package:my_flutter_template/core/network/network_info.dart';
import 'package:my_flutter_template/core/requests/forget_password_request.dart';
import 'package:my_flutter_template/core/requests/login_request.dart';
import 'package:my_flutter_template/core/requests/send_otp_request.dart';
import 'package:my_flutter_template/core/requests/signup_request.dart';
import 'package:my_flutter_template/core/requests/verify_otp_request.dart';
import 'package:my_flutter_template/core/utils/network_method.dart';
import 'package:my_flutter_template/data/repositories/base_repository.dart';
import 'package:my_flutter_template/features/authentication/auth/data/models/credentials_model.dart';
import 'package:my_flutter_template/features/authentication/auth/data/models/user_content_model.dart';

import 'package:injectable/injectable.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserContentModel>> signIn(LoginRequest request);
  Future<Either<Failure, String>> signUp(SignupRequest request);
  Future<Either<Failure, String>> forgetPassword(ForgetPasswordRequest request);
  Future<Either<Failure, String>> getWalletBalance();
}

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  AuthRepositoryImpl({
    required LocalStorage localStorage,
    required ApiConsumer apiConsumer,
    required NetworkInfo networkInfo,
  }) : super(
          localStorage: localStorage,
          apiConsumer: apiConsumer,
          networkInfo: networkInfo,
        );

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
              "userProfile": {
                'fullName': 'منظمة H2O',
                'email': 'email',
                'imageUrl':
                    'https://gravatar.com/avatar/16da400a4fdcc3086142b7af28655b3e?s=400&d=robohash&r=x',
                'phoneNumber': 'phoneNumber',
                'walletTotal': '24899',
                "accountType": 2,
              }
            }
          }),
      onSuccess: (credentials) async {
        final accessToken = credentials.data?.accessToken ?? '';
        final refreshToken = credentials.data?.refreshToken ?? '';

        await localStorage.appStarted();
        await localStorage.refreshAccessToken(accessToken);
        await localStorage.refreshRefreshTokenToken(refreshToken);

        return credentials.data!.user;
      },
    );
  }

  @override
  Future<Either<Failure, String>> signUp(SignupRequest request) async {
    return executeRequest<MessageModel, String>(
      requestFunction: () async =>
          apiConsumer.request<MessageModel>(MessageModel.new,
              path: EndPoints.registration,
              method: NetworkMethod.multipart,
              body: {
                ...request.toJson(),
                "Image": await MultipartFile.fromFile(request.imagePath,
                    filename: "pfp.png"),
              },
              authorization: await localStorage.publicToken,
              mockResponse: {"statusCode": 200, "data": 'secsuss'}),
      onSuccess: (credentials) async {
        return credentials.data ?? '';
      },
    );
  }

  @override
  Future<Either<Failure, String>> getWalletBalance() async {
    return executeRequest<MessageModel, String>(
      requestFunction: () async => apiConsumer.request<MessageModel>(
          MessageModel.new,
          path: EndPoints.getWalletBalance,
          method: NetworkMethod.get,
          queryParameters: {"isUserWallet": true},
          authorization: await localStorage.accessToken,
          mockResponse: {"statusCode": 200, "data": '200'}),
      onSuccess: (balance) async {
        return balance.data ?? '';
      },
    );
  }

  @override
  Future<Either<Failure, String>> forgetPassword(
      ForgetPasswordRequest request) async {
    return executeRequest<MessageModel, String>(
      requestFunction: () async => apiConsumer.request<MessageModel>(
          MessageModel.new,
          path: EndPoints.signIn,
          method: NetworkMethod.post,
          queryParameters: request.toJson(),
          authorization: await localStorage.publicToken,
          mockResponse: {"statusCode": 200, "data": 'secsuss'}),
      onSuccess: (credentials) async {
        return credentials.data ?? '';
      },
    );
  }
}
