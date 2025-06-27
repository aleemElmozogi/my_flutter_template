import 'package:my_flutter_template/core/models/json_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_pagination_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BasePaginationModel<T> extends JsonModel {
  @JsonKey(name: 'numberOfPages', defaultValue: 0)
  final num numberOfPages;
  @JsonKey(name: 'pageSize', defaultValue: 0)
  final num pageSize;
  @JsonKey(name: 'pageNumber', defaultValue: 1)
  final num pageNumber;
  @JsonKey(name: 'pageContent', defaultValue: [])
  final List<T> pageContent;

  BasePaginationModel(
    this.numberOfPages,
    this.pageNumber,
    this.pageSize,
    this.pageContent,
  );

  factory BasePaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BasePaginationModelFromJson(json, fromJsonT);

  @override
  BasePaginationModel<T> fromJson(Map<String, dynamic> json) =>
      _$BasePaginationModelFromJson(json, (json) => json as T);

  @override
  Map<String, dynamic> toJson() =>
      _$BasePaginationModelToJson(this, (T value) => value);

  @override
  // TODO: implement props
  List<Object?> get props => [pageSize, pageContent, pageNumber, numberOfPages];
}
