// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel()
  ..resultType = (json['type'] as num?)?.toInt() ?? 0
  ..message = json['message'] as String? ?? ''
  ..content = json['content'] == null
      ? null
      : UserContentModel.fromJson(json['content'] as Map<String, dynamic>);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'type': instance.resultType,
      'message': instance.message,
      'content': instance.content,
    };
