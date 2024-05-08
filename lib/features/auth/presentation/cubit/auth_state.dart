
import 'package:my_flutter_template/core/enums/auth_status.dart';
import 'package:my_flutter_template/core/enums/fetch_status.dart';
import 'package:my_flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default('') String pin,
    @Default('') String message,
    @Default('') String email,
    @Default(false) bool isSubscribeToFcmTopic,
    UserEntity? userEntity,
    @Default(AuthStatus.unAuthenticated) AuthStatus authState,
    @Default(CallStatus.pure) CallStatus fetchUserInfoState,
    @Default(CallStatus.pure) CallStatus signInStatus,
  }) = _AuthState;
}
