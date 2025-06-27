// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  String get message => throw _privateConstructorUsedError;
  UserContentModel? get userEntity => throw _privateConstructorUsedError;
  AuthStatus get authState => throw _privateConstructorUsedError;
  CallStatus get signInStatus => throw _privateConstructorUsedError;
  CallStatus get changePasswordStatus => throw _privateConstructorUsedError;
  CallStatus get getWalletBalanceStatus => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {String message,
      UserContentModel? userEntity,
      AuthStatus authState,
      CallStatus signInStatus,
      CallStatus changePasswordStatus,
      CallStatus getWalletBalanceStatus});

  $UserContentModelCopyWith<$Res>? get userEntity;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? userEntity = freezed,
    Object? authState = null,
    Object? signInStatus = null,
    Object? changePasswordStatus = null,
    Object? getWalletBalanceStatus = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      userEntity: freezed == userEntity
          ? _value.userEntity
          : userEntity // ignore: cast_nullable_to_non_nullable
              as UserContentModel?,
      authState: null == authState
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      signInStatus: null == signInStatus
          ? _value.signInStatus
          : signInStatus // ignore: cast_nullable_to_non_nullable
              as CallStatus,
      changePasswordStatus: null == changePasswordStatus
          ? _value.changePasswordStatus
          : changePasswordStatus // ignore: cast_nullable_to_non_nullable
              as CallStatus,
      getWalletBalanceStatus: null == getWalletBalanceStatus
          ? _value.getWalletBalanceStatus
          : getWalletBalanceStatus // ignore: cast_nullable_to_non_nullable
              as CallStatus,
    ) as $Val);
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserContentModelCopyWith<$Res>? get userEntity {
    if (_value.userEntity == null) {
      return null;
    }

    return $UserContentModelCopyWith<$Res>(_value.userEntity!, (value) {
      return _then(_value.copyWith(userEntity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      UserContentModel? userEntity,
      AuthStatus authState,
      CallStatus signInStatus,
      CallStatus changePasswordStatus,
      CallStatus getWalletBalanceStatus});

  @override
  $UserContentModelCopyWith<$Res>? get userEntity;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? userEntity = freezed,
    Object? authState = null,
    Object? signInStatus = null,
    Object? changePasswordStatus = null,
    Object? getWalletBalanceStatus = null,
  }) {
    return _then(_$AuthStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      userEntity: freezed == userEntity
          ? _value.userEntity
          : userEntity // ignore: cast_nullable_to_non_nullable
              as UserContentModel?,
      authState: null == authState
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      signInStatus: null == signInStatus
          ? _value.signInStatus
          : signInStatus // ignore: cast_nullable_to_non_nullable
              as CallStatus,
      changePasswordStatus: null == changePasswordStatus
          ? _value.changePasswordStatus
          : changePasswordStatus // ignore: cast_nullable_to_non_nullable
              as CallStatus,
      getWalletBalanceStatus: null == getWalletBalanceStatus
          ? _value.getWalletBalanceStatus
          : getWalletBalanceStatus // ignore: cast_nullable_to_non_nullable
              as CallStatus,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {this.message = '',
      this.userEntity,
      this.authState = AuthStatus.unAuthenticated,
      this.signInStatus = CallStatus.pure,
      this.changePasswordStatus = CallStatus.pure,
      this.getWalletBalanceStatus = CallStatus.pure});

  @override
  @JsonKey()
  final String message;
  @override
  final UserContentModel? userEntity;
  @override
  @JsonKey()
  final AuthStatus authState;
  @override
  @JsonKey()
  final CallStatus signInStatus;
  @override
  @JsonKey()
  final CallStatus changePasswordStatus;
  @override
  @JsonKey()
  final CallStatus getWalletBalanceStatus;

  @override
  String toString() {
    return 'AuthState(message: $message, userEntity: $userEntity, authState: $authState, signInStatus: $signInStatus, changePasswordStatus: $changePasswordStatus, getWalletBalanceStatus: $getWalletBalanceStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.userEntity, userEntity) ||
                other.userEntity == userEntity) &&
            (identical(other.authState, authState) ||
                other.authState == authState) &&
            (identical(other.signInStatus, signInStatus) ||
                other.signInStatus == signInStatus) &&
            (identical(other.changePasswordStatus, changePasswordStatus) ||
                other.changePasswordStatus == changePasswordStatus) &&
            (identical(other.getWalletBalanceStatus, getWalletBalanceStatus) ||
                other.getWalletBalanceStatus == getWalletBalanceStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, userEntity, authState,
      signInStatus, changePasswordStatus, getWalletBalanceStatus);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final String message,
      final UserContentModel? userEntity,
      final AuthStatus authState,
      final CallStatus signInStatus,
      final CallStatus changePasswordStatus,
      final CallStatus getWalletBalanceStatus}) = _$AuthStateImpl;

  @override
  String get message;
  @override
  UserContentModel? get userEntity;
  @override
  AuthStatus get authState;
  @override
  CallStatus get signInStatus;
  @override
  CallStatus get changePasswordStatus;
  @override
  CallStatus get getWalletBalanceStatus;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
