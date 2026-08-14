import 'dart:convert';

import 'package:my_flutter_template/core/models/json_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_city_circle_content_model.g.dart';

@JsonSerializable()
class CityCircleContentModel extends JsonModel<CityCircleContentModel> {
  CityCircleContentModel({
    required this.circleCode,
    required this.circleId,
    required this.circleName,
  });

  factory CityCircleContentModel.fromJson(Map<String, dynamic> json) =>
      _$CityCircleContentModelFromJson(json);

  factory CityCircleContentModel.fromStorage(String data) =>
      CityCircleContentModel.fromJson(
        json.decode(data) as Map<String, dynamic>,
      );

  @JsonKey(defaultValue: '')
  final String circleCode;
  @JsonKey(defaultValue: '')
  final String circleId;
  @JsonKey(defaultValue: '')
  final String circleName;

  @override
  Map<String, dynamic> toJson() => _$CityCircleContentModelToJson(this);

  @override
  CityCircleContentModel fromJson(Map<String, dynamic> json) =>
      CityCircleContentModel.fromJson(json);

  @override
  List<Object?> get props => [circleCode, circleId, circleName];
}
