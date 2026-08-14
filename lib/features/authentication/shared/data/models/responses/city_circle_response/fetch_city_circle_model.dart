import 'package:my_flutter_template/core/models/response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'fetch_city_circle_content_model.dart' show CityCircleContentModel;

part 'fetch_city_circle_model.g.dart';

@JsonSerializable()
class CityCircleModel
    extends ResponseModel<CityCircleModel, List<CityCircleContentModel>> {
  CityCircleModel();

  factory CityCircleModel.fromJson(Map<String, dynamic> json) =>
      _$CityCircleModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CityCircleModelToJson(this);

  @override
  CityCircleModel fromJson(Map<String, dynamic> json) =>
      CityCircleModel.fromJson(json);

  @override
  List<Object?> get props => [];
}
