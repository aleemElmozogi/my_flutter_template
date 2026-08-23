import 'package:my_flutter_template/core/enums/auth_status.dart';
import 'package:my_flutter_template/core/enums/fetch_status.dart';
import 'package:my_flutter_template/core/localStorage/loacal_storage.dart';
import 'package:my_flutter_template/core/requests/login_request.dart';
import 'package:my_flutter_template/features/authentication/auth/domain/usecases/auth_usecase.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

import 'auth_state.dart';

enum StartupAuthResult { firstStart, authenticated, unAuthenticated }

@LazySingleton()
class AuthCubit extends Cubit<AuthState> {
  final AuthUsecase _authUsecase;
  final LocalStorage _localStorage;
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  AuthCubit(this._authUsecase, this._localStorage) : super(const AuthState());

  Future<void> logOut() async {
    emit(state.copyWith(authState: AuthStatus.unAuthenticated));
    await _localStorage.refreshAccessToken('');
    await _localStorage.refreshRefreshTokenToken('');
    await _localStorage.clearLoginCredentials();
    emit(state.copyWith(userEntity: null));
  }

  Future<bool> get firstStart async => await _localStorage.isFirstStart;

  Future<void> completeFirstStart() => _localStorage.appStarted();

  Future<StartupAuthResult> resolveStartupAuth() async {
    if (await _localStorage.isFirstStart) {
      return StartupAuthResult.firstStart;
    }

    if (!await _localStorage.rememberLogin) {
      return StartupAuthResult.unAuthenticated;
    }

    final phone = await _localStorage.savedLoginPhone;
    final password = await _localStorage.savedLoginPassword;
    if (phone.isEmpty || password.isEmpty) {
      await _localStorage.clearLoginCredentials();
      return StartupAuthResult.unAuthenticated;
    }

    if (await _localStorage.biometricLoginEnabled &&
        !await _authenticateWithBiometrics()) {
      return StartupAuthResult.unAuthenticated;
    }

    if ((await _localStorage.accessToken).isNotEmpty) {
      emit(state.copyWith(authState: AuthStatus.authenticated));
      return StartupAuthResult.authenticated;
    }

    final response = await _authUsecase(
      LoginRequest(password: password, phone: phone),
    );
    return response.fold(
      (failure) {
        emit(
          state.copyWith(
            authState: AuthStatus.unAuthenticated,
            message: failure.message.toString(),
          ),
        );
        return StartupAuthResult.unAuthenticated;
      },
      (userContent) {
        emit(
          state.copyWith(
            userEntity: userContent,
            authState: AuthStatus.authenticated,
          ),
        );
        return StartupAuthResult.authenticated;
      },
    );
  }

  Future<void> onForceLogout() async {
    emit(state.copyWith(authState: AuthStatus.unAuthenticated));
    await _localStorage.refreshAccessToken('');
    await _localStorage.refreshRefreshTokenToken('');
    await _localStorage.clearLoginCredentials();
    emit(state.copyWith(userEntity: null));
  }

  Future<void> login(
    String phone,
    String password, {
    bool rememberLogin = false,
    bool biometricLogin = false,
  }) async {
    emit(state.copyWith(signInStatus: CallStatus.inProgress));
    final response = await _authUsecase(
      LoginRequest(password: password, phone: phone),
    );
    await response.fold<Future<void>>(
      (failure) async => emit(
        state.copyWith(
          signInStatus: CallStatus.failed,
          authState: AuthStatus.unAuthenticated,
          message: failure.message.toString(),
        ),
      ),
      (userContent) async {
        final biometricEnabled =
            biometricLogin && await _authenticateWithBiometrics();
        final shouldRememberLogin = rememberLogin || biometricEnabled;

        if (shouldRememberLogin) {
          await _localStorage.saveLoginCredentials(
            phone: phone,
            password: password,
            biometricEnabled: biometricEnabled,
          );
        } else {
          await _localStorage.clearLoginCredentials();
        }
        emit(
          state.copyWith(
            userEntity: userContent,
            signInStatus: CallStatus.success,
            authState: AuthStatus.authenticated,
          ),
        );
      },
    );
  }

  Future<bool> _authenticateWithBiometrics() async {
    try {
      if (!await _localAuthentication.canCheckBiometrics) {
        return false;
      }
      return await _localAuthentication.authenticate(
        localizedReason: 'Authenticate to continue',
        biometricOnly: true,
        persistAcrossBackgrounding: true,
      );
    } catch (_) {
      return false;
    }
  }
}
