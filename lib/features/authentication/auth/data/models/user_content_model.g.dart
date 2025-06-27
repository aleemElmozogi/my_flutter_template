// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserContentModelImpl _$$UserContentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserContentModelImpl(
      userName: json['fullName'] as String? ?? '',
      userEmail: json['email'] as String? ?? '',
      profileImageUrl: json['imageUrl'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      walletTotal: json['walletTotal'] as String? ?? '0',
      accountType: json['accountType'] == null
          ? AccountTypeStatus.helper
          : AccountTypeStatus.fromJson((json['accountType'] as num).toInt()),
    );

Map<String, dynamic> _$$UserContentModelImplToJson(
        _$UserContentModelImpl instance) =>
    <String, dynamic>{
      'fullName': instance.userName,
      'email': instance.userEmail,
      'imageUrl': instance.profileImageUrl,
      'phoneNumber': instance.phoneNumber,
      'walletTotal': instance.walletTotal,
      'accountType': instance.accountType,
    };
