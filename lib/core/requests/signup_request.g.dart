// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'Password': instance.password,
      'Name': instance.name,
      'PhoneNumber': instance.phoneNumber,
      'UserType': instance.accountType?.toJson(),
    };
