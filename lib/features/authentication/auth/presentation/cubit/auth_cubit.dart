import 'package:my_flutter_template/core/enums/auth_status.dart';
import 'package:my_flutter_template/core/enums/fetch_status.dart';
import 'package:my_flutter_template/core/localStorage/loacal_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/features/authentication/auth/data/models/login_request.dart';
import 'package:my_flutter_template/features/authentication/auth/domain/usecases/auth_usecase.dart';
import 'package:my_flutter_template/features/authentication/auth/domain/usecases/notification_issubscribed_usecase.dart';
import 'package:my_flutter_template/features/authentication/auth/domain/usecases/notification_subscripe_usecase.dart';
import 'package:my_flutter_template/features/authentication/auth/domain/usecases/notification_unsubscripe_usecase.dart';
import 'package:my_flutter_template/features/authentication/auth/domain/usecases/set_up_remote_notification.dart';

import 'auth_state.dart';

@LazySingleton()
class AuthCubit extends Cubit<AuthState> {
  final AuthUsecase _authUsecase;
  final LocalStorage _localStorage;

  AuthCubit({
    required AuthUsecase authUsecase,
    required SetUpRemoteNotificationUsecase setUpRemoteNotificationUsecase,
    required IsSubscribedToTopicUsecase isSubscribedToTopicUsecase,
    required UnSubscribeToTopicUsecase unSubscribeToTopicUsecase,
    required LocalStorage localStorage,
    required SubscribeToTopicUsecase subscribeToTopicUsecase,
  }) : _authUsecase = authUsecase,
       _localStorage = localStorage,
       super(const AuthState());

  void onEmailChange(String email) {
    emit(state.copyWith(email: email));
  }

  void onPinChange(String value) {
    emit(state.copyWith(pin: value));
  }

  Future<void> logOut() async {
    emit(state.copyWith(authState: AuthStatus.unAuthenticated));
    await _localStorage.refreshAccessToken('');
    emit(state.copyWith(userEntity: null, pin: '', email: ''));
  }

  Future<void> onForceLogout() async {
    emit(state.copyWith(authState: AuthStatus.unAuthenticated));
    await _localStorage.refreshAccessToken('');
    emit(state.copyWith(userEntity: null, pin: '', email: ''));
  }

  Future<void> login() async {
    emit(state.copyWith(signInStatus: CallStatus.inProgress));
    final response = await _authUsecase(
      LoginRequest(pin: state.pin, email: state.email),
    );
    response.fold(
      (failure) => emit(
        state.copyWith(
          signInStatus: CallStatus.failed,
          message: failure.message.toString(),
        ),
      ),
      (userContent) async {
        // if (rememberMe) {
        //   await _localStorage.saveLoginCredentials(
        //     phone: phone,
        //     password: password,
        //   );
        // } else {
        //   // await _localStorage.clearLoginCredentials();
        // }
        emit(
          state.copyWith(
            // userEntity: userContent,
            signInStatus: CallStatus.success,
            authState: AuthStatus.authenticated,
            message: '',
          ),
        );
      },
    );
  }
}
