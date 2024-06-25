import 'package:freezed_annotation/freezed_annotation.dart';

import 'json_model.dart';

part 'pagination_metadata_model.g.dart';

@JsonSerializable()
class MetadataModel extends JsonModel<MetadataModel> {
  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'pageSize')
  int? pageSize;

  @JsonKey(name: 'totalPages')
  int? totalPages;

  MetadataModel({this.page, this.pageSize, this.totalPages});

  factory MetadataModel.fromJson(Map<String, dynamic> json) =>
      _$MetadataModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MetadataModelToJson(this);

  @override
  MetadataModel fromJson(Map<String, dynamic> json) =>
      MetadataModel.fromJson(json);

  @override
  List<Object?> get props => [page, pageSize, totalPages];
}
