// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_content_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserContentModel _$UserContentModelFromJson(Map<String, dynamic> json) {
  return _UserContentModel.fromJson(json);
}

/// @nodoc
mixin _$UserContentModel {
  @JsonKey(name: 'fullName')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get userEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String get profileImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'phoneNumber')
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'walletTotal')
  String get walletTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'accountType')
  AccountTypeStatus get accountType => throw _privateConstructorUsedError;

  /// Serializes this UserContentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserContentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserContentModelCopyWith<UserContentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserContentModelCopyWith<$Res> {
  factory $UserContentModelCopyWith(
          UserContentModel value, $Res Function(UserContentModel) then) =
      _$UserContentModelCopyWithImpl<$Res, UserContentModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'fullName') String userName,
      @JsonKey(name: 'email') String userEmail,
      @JsonKey(name: 'imageUrl') String profileImageUrl,
      @JsonKey(name: 'phoneNumber') String phoneNumber,
      @JsonKey(name: 'walletTotal') String walletTotal,
      @JsonKey(name: 'accountType') AccountTypeStatus accountType});
}

/// @nodoc
class _$UserContentModelCopyWithImpl<$Res, $Val extends UserContentModel>
    implements $UserContentModelCopyWith<$Res> {
  _$UserContentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserContentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userEmail = null,
    Object? profileImageUrl = null,
    Object? phoneNumber = null,
    Object? walletTotal = null,
    Object? accountType = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      walletTotal: null == walletTotal
          ? _value.walletTotal
          : walletTotal // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountTypeStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserContentModelImplCopyWith<$Res>
    implements $UserContentModelCopyWith<$Res> {
  factory _$$UserContentModelImplCopyWith(_$UserContentModelImpl value,
          $Res Function(_$UserContentModelImpl) then) =
      __$$UserContentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'fullName') String userName,
      @JsonKey(name: 'email') String userEmail,
      @JsonKey(name: 'imageUrl') String profileImageUrl,
      @JsonKey(name: 'phoneNumber') String phoneNumber,
      @JsonKey(name: 'walletTotal') String walletTotal,
      @JsonKey(name: 'accountType') AccountTypeStatus accountType});
}

/// @nodoc
class __$$UserContentModelImplCopyWithImpl<$Res>
    extends _$UserContentModelCopyWithImpl<$Res, _$UserContentModelImpl>
    implements _$$UserContentModelImplCopyWith<$Res> {
  __$$UserContentModelImplCopyWithImpl(_$UserContentModelImpl _value,
      $Res Function(_$UserContentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserContentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userEmail = null,
    Object? profileImageUrl = null,
    Object? phoneNumber = null,
    Object? walletTotal = null,
    Object? accountType = null,
  }) {
    return _then(_$UserContentModelImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      walletTotal: null == walletTotal
          ? _value.walletTotal
          : walletTotal // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountTypeStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserContentModelImpl implements _UserContentModel {
  const _$UserContentModelImpl(
      {@JsonKey(name: 'fullName') this.userName = '',
      @JsonKey(name: 'email') this.userEmail = '',
      @JsonKey(name: 'imageUrl') this.profileImageUrl = '',
      @JsonKey(name: 'phoneNumber') this.phoneNumber = '',
      @JsonKey(name: 'walletTotal') this.walletTotal = '0',
      @JsonKey(name: 'accountType')
      this.accountType = AccountTypeStatus.helper});

  factory _$UserContentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserContentModelImplFromJson(json);

  @override
  @JsonKey(name: 'fullName')
  final String userName;
  @override
  @JsonKey(name: 'email')
  final String userEmail;
  @override
  @JsonKey(name: 'imageUrl')
  final String profileImageUrl;
  @override
  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;
  @override
  @JsonKey(name: 'walletTotal')
  final String walletTotal;
  @override
  @JsonKey(name: 'accountType')
  final AccountTypeStatus accountType;

  @override
  String toString() {
    return 'UserContentModel(userName: $userName, userEmail: $userEmail, profileImageUrl: $profileImageUrl, phoneNumber: $phoneNumber, walletTotal: $walletTotal, accountType: $accountType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserContentModelImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.walletTotal, walletTotal) ||
                other.walletTotal == walletTotal) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userName, userEmail,
      profileImageUrl, phoneNumber, walletTotal, accountType);

  /// Create a copy of UserContentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserContentModelImplCopyWith<_$UserContentModelImpl> get copyWith =>
      __$$UserContentModelImplCopyWithImpl<_$UserContentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserContentModelImplToJson(
      this,
    );
  }
}

abstract class _UserContentModel implements UserContentModel {
  const factory _UserContentModel(
          {@JsonKey(name: 'fullName') final String userName,
          @JsonKey(name: 'email') final String userEmail,
          @JsonKey(name: 'imageUrl') final String profileImageUrl,
          @JsonKey(name: 'phoneNumber') final String phoneNumber,
          @JsonKey(name: 'walletTotal') final String walletTotal,
          @JsonKey(name: 'accountType') final AccountTypeStatus accountType}) =
      _$UserContentModelImpl;

  factory _UserContentModel.fromJson(Map<String, dynamic> json) =
      _$UserContentModelImpl.fromJson;

  @override
  @JsonKey(name: 'fullName')
  String get userName;
  @override
  @JsonKey(name: 'email')
  String get userEmail;
  @override
  @JsonKey(name: 'imageUrl')
  String get profileImageUrl;
  @override
  @JsonKey(name: 'phoneNumber')
  String get phoneNumber;
  @override
  @JsonKey(name: 'walletTotal')
  String get walletTotal;
  @override
  @JsonKey(name: 'accountType')
  AccountTypeStatus get accountType;

  /// Create a copy of UserContentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserContentModelImplCopyWith<_$UserContentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
