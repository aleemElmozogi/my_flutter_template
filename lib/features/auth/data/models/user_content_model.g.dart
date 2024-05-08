// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserContentModel _$UserContentModelFromJson(Map<String, dynamic> json) =>
    UserContentModel(
      userId: json['id'] as String? ?? '',
      userName: json['fullName'] as String? ?? '',
      userEmail: json['email'] as String? ?? '',
      profileImageUrl: json['imageUrl'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      accountType: json['type'] == null
          ? AccountTypeStatus.customer
          : AccountTypeStatus.fromJson((json['type'] as num).toInt()),
    );

Map<String, dynamic> _$UserContentModelToJson(UserContentModel instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'fullName': instance.userName,
      'email': instance.userEmail,
      'imageUrl': instance.profileImageUrl,
      'phoneNumber': instance.phoneNumber,
      'type': instance.accountType,
    };
