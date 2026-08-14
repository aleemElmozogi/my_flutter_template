import 'dart:convert';

import 'package:my_flutter_template/core/models/json_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_city_content_model.g.dart';

@JsonSerializable()
class CityContentModel extends JsonModel<CityContentModel> {
  CityContentModel({required this.cityId, required this.cityName});

  factory CityContentModel.fromJson(Map<String, dynamic> json) =>
      _$CityContentModelFromJson(json);

  factory CityContentModel.fromStorage(String data) =>
      CityContentModel.fromJson(json.decode(data) as Map<String, dynamic>);

  @JsonKey(defaultValue: '')
  final String cityId;
  @JsonKey(defaultValue: '')
  final String cityName;

  @override
  Map<String, dynamic> toJson() => _$CityContentModelToJson(this);

  @override
  CityContentModel fromJson(Map<String, dynamic> json) =>
      CityContentModel.fromJson(json);

  @override
  List<Object?> get props => [cityName, cityId];
}
