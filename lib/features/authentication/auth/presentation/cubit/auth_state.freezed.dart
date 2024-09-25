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
  String get pin => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get isSubscribeToFcmTopic => throw _privateConstructorUsedError;
  UserEntity? get userEntity => throw _privateConstructorUsedError;
  AuthStatus get authState => throw _privateConstructorUsedError;
  CallStatus get fetchUserInfoState => throw _privateConstructorUsedError;
  CallStatus get signInStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {String pin,
      String message,
      String email,
      bool isSubscribeToFcmTopic,
      UserEntity? userEntity,
      AuthStatus authState,
      CallStatus fetchUserInfoState,
      CallStatus signInStatus});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pin = null,
    Object? message = null,
    Object? email = null,
    Object? isSubscribeToFcmTopic = null,
    Object? userEntity = freezed,
    Object? authState = null,
    Object? fetchUserInfoState = null,
    Object? signInStatus = null,
  }) {
    return _then(_value.copyWith(
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscribeToFcmTopic: null == isSubscribeToFcmTopic
          ? _value.isSubscribeToFcmTopic
          : isSubscribeToFcmTopic // ignore: cast_nullable_to_non_nullable
              as bool,
      userEntity: freezed == userEntity
          ? _value.userEntity
          : userEntity // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      authState: null == authState
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      fetchUserInfoState: null == fetchUserInfoState
          ? _value.fetchUserInfoState
          : fetchUserInfoState // ignore: cast_nullable_to_non_nullable
              as CallStatus,
      signInStatus: null == signInStatus
          ? _value.signInStatus
          : signInStatus // ignore: cast_nullable_to_non_nullable
              as CallStatus,
    ) as $Val);
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
      {String pin,
      String message,
      String email,
      bool isSubscribeToFcmTopic,
      UserEntity? userEntity,
      AuthStatus authState,
      CallStatus fetchUserInfoState,
      CallStatus signInStatus});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pin = null,
    Object? message = null,
    Object? email = null,
    Object? isSubscribeToFcmTopic = null,
    Object? userEntity = freezed,
    Object? authState = null,
    Object? fetchUserInfoState = null,
    Object? signInStatus = null,
  }) {
    return _then(_$AuthStateImpl(
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscribeToFcmTopic: null == isSubscribeToFcmTopic
          ? _value.isSubscribeToFcmTopic
          : isSubscribeToFcmTopic // ignore: cast_nullable_to_non_nullable
              as bool,
      userEntity: freezed == userEntity
          ? _value.userEntity
          : userEntity // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      authState: null == authState
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      fetchUserInfoState: null == fetchUserInfoState
          ? _value.fetchUserInfoState
          : fetchUserInfoState // ignore: cast_nullable_to_non_nullable
              as CallStatus,
      signInStatus: null == signInStatus
          ? _value.signInStatus
          : signInStatus // ignore: cast_nullable_to_non_nullable
              as CallStatus,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {this.pin = '',
      this.message = '',
      this.email = '',
      this.isSubscribeToFcmTopic = false,
      this.userEntity,
      this.authState = AuthStatus.unAuthenticated,
      this.fetchUserInfoState = CallStatus.pure,
      this.signInStatus = CallStatus.pure});

  @override
  @JsonKey()
  final String pin;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final bool isSubscribeToFcmTopic;
  @override
  final UserEntity? userEntity;
  @override
  @JsonKey()
  final AuthStatus authState;
  @override
  @JsonKey()
  final CallStatus fetchUserInfoState;
  @override
  @JsonKey()
  final CallStatus signInStatus;

  @override
  String toString() {
    return 'AuthState(pin: $pin, message: $message, email: $email, isSubscribeToFcmTopic: $isSubscribeToFcmTopic, userEntity: $userEntity, authState: $authState, fetchUserInfoState: $fetchUserInfoState, signInStatus: $signInStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isSubscribeToFcmTopic, isSubscribeToFcmTopic) ||
                other.isSubscribeToFcmTopic == isSubscribeToFcmTopic) &&
            (identical(other.userEntity, userEntity) ||
                other.userEntity == userEntity) &&
            (identical(other.authState, authState) ||
                other.authState == authState) &&
            (identical(other.fetchUserInfoState, fetchUserInfoState) ||
                other.fetchUserInfoState == fetchUserInfoState) &&
            (identical(other.signInStatus, signInStatus) ||
                other.signInStatus == signInStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pin,
      message,
      email,
      isSubscribeToFcmTopic,
      userEntity,
      authState,
      fetchUserInfoState,
      signInStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final String pin,
      final String message,
      final String email,
      final bool isSubscribeToFcmTopic,
      final UserEntity? userEntity,
      final AuthStatus authState,
      final CallStatus fetchUserInfoState,
      final CallStatus signInStatus}) = _$AuthStateImpl;

  @override
  String get pin;
  @override
  String get message;
  @override
  String get email;
  @override
  bool get isSubscribeToFcmTopic;
  @override
  UserEntity? get userEntity;
  @override
  AuthStatus get authState;
  @override
  CallStatus get fetchUserInfoState;
  @override
  CallStatus get signInStatus;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
