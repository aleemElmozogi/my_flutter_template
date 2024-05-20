import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/enums/auth_status.dart';
import 'package:my_flutter_template/core/enums/fetch_status.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:my_flutter_template/features/auth/domain/entities/user_auth_entity.dart';
import 'package:my_flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:my_flutter_template/features/auth/domain/usecases/auth_usecase.dart';
import 'package:my_flutter_template/features/auth/domain/usecases/notification_issubscribed_usecase.dart';
import 'package:my_flutter_template/features/auth/domain/usecases/notification_subscripe_usecase.dart';
import 'package:my_flutter_template/features/auth/domain/usecases/notification_unsubscripe_usecase.dart';
import 'package:my_flutter_template/features/auth/domain/usecases/set_up_remote_notification.dart';
import 'package:my_flutter_template/features/auth/domain/usecases/user_info_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/localStorage/loacal_storage.dart';
import 'auth_state.dart';

@LazySingleton()
class AuthCubit extends Cubit<AuthState> {
  final AuthUsecase _authUsecase;
  final UserInfoUsecase _userInfoUsecase;
  final LocalStorage _localStorage;

  AuthCubit(
      {required AuthUsecase authUsecase,
      required UserInfoUsecase userInfoUsecase,
      required SetUpRemoteNotificationUsecase setUpRemoteNotificationUsecase,
      required IsSubscribedToTopicUsecase isSubscribedToTopicUsecase,
      required UnSubscribeToTopicUsecase unSubscribeToTopicUsecase,
      required LocalStorage localStorage,
      required SubscribeToTopicUsecase subscribeToTopicUsecase})
      : _authUsecase = authUsecase,
        _userInfoUsecase = userInfoUsecase,
        _localStorage = localStorage,
        super(const AuthState());

  void onEmailChange(String email) {
    emit(state.copyWith(email: email));
  }

  void onPinChange(String value) {
    emit(state.copyWith(pin: value));
  }

  Future<void> logOut() async {
    emit(state.copyWith(
      authState: AuthStatus.unAuthenticated,
    ));
    await _localStorage.refreshAccessToken('');
    emit(state.copyWith(userEntity: null, pin: '', email: ''));
  }

  Future<void> onForceLogout() async {
    emit(state.copyWith(
      authState: AuthStatus.unAuthenticated,
    ));
    await _localStorage.refreshAccessToken('');
    emit(state.copyWith(userEntity: null, pin: '', email: ''));
  }

  Future<void> login() async {
    emit(state.copyWith(signInStatus: CallStatus.inProgress));
    Either<Failure, String> response = await _authUsecase(
        UserAuthEntity(pin: state.pin, email: state.email));
    response.fold(
        (failure) => emit(state.copyWith(
            signInStatus: CallStatus.failed,
            message: failure.message.toString())),
        (message) => fetchUserInfo());
  }

  Future<void> fetchUserInfo() async {
    emit(state.copyWith(fetchUserInfoState: CallStatus.inProgress));

    Either<Failure, UserEntity> response = await _userInfoUsecase(NoParams());
    response.fold(
        (failure) => emit(state.copyWith(
            signInStatus: CallStatus.failed,
            fetchUserInfoState: CallStatus.failed,
            message: failure.message.toString())), (userEntity) {
      emit(state.copyWith(
          userEntity: userEntity,
          pin: '',
          fetchUserInfoState: CallStatus.success,
          signInStatus: CallStatus.success,
          authState: AuthStatus.authenticated));
    });
  }
}
