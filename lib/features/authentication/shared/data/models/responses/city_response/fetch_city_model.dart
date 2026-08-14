import 'package:my_flutter_template/core/models/response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'fetch_city_content_model.dart' show CityContentModel;

part 'fetch_city_model.g.dart';

@JsonSerializable()
class CityModel extends ResponseModel<CityModel, List<CityContentModel>> {
  CityModel();

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  @override
  CityModel fromJson(Map<String, dynamic> json) => CityModel.fromJson(json);

  @override
  List<Object?> get props => [];
}
