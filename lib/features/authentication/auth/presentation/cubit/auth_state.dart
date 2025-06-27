import 'package:my_flutter_template/core/enums/auth_status.dart';
import 'package:my_flutter_template/core/enums/fetch_status.dart';
import 'package:my_flutter_template/core/enums/transaction_state.dart';
import 'package:my_flutter_template/features/authentication/auth/data/models/user_content_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default('') String message,
    UserContentModel? userEntity,
    @Default(AuthStatus.unAuthenticated) AuthStatus authState,
    @Default(CallStatus.pure) CallStatus signInStatus,
    @Default(CallStatus.pure) CallStatus changePasswordStatus,
    @Default(CallStatus.pure) CallStatus getWalletBalanceStatus,
  }) = _AuthState;
}
