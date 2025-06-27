// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePaginationModel<T> _$BasePaginationModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BasePaginationModel<T>(
      json['numberOfPages'] as num? ?? 0,
      json['pageNumber'] as num? ?? 1,
      json['pageSize'] as num? ?? 0,
      (json['pageContent'] as List<dynamic>?)?.map(fromJsonT).toList() ?? [],
    );

Map<String, dynamic> _$BasePaginationModelToJson<T>(
  BasePaginationModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'numberOfPages': instance.numberOfPages,
      'pageSize': instance.pageSize,
      'pageNumber': instance.pageNumber,
      'pageContent': instance.pageContent.map(toJsonT).toList(),
    };
