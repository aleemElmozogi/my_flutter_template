// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialsModel _$CredentialsModelFromJson(Map<String, dynamic> json) =>
    CredentialsModel()
      ..statusCode = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..data = json['data'] == null
          ? null
          : CredentialsContentModel.fromJson(
              json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$CredentialsModelToJson(CredentialsModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
