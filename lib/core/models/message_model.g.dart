// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel()
  ..resultType = (json['type'] as num?)?.toInt() ?? 0
  ..message = json['message'] as String? ?? ''
  ..content = json['content'] as String?;

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'type': instance.resultType,
      'message': instance.message,
      'content': instance.content,
    };
