// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_metadata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetadataModel _$MetadataModelFromJson(Map<String, dynamic> json) =>
    MetadataModel(
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetadataModelToJson(MetadataModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'totalPages': instance.totalPages,
    };
