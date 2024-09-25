import 'package:json_annotation/json_annotation.dart';

import 'json_model.dart';

part 'error_response_model.g.dart';

@JsonSerializable()
class ErrorResponseModel extends JsonModel<ErrorResponseModel> {
  @JsonKey(name: 'statusCode')
  final int? statusCode;

  @JsonKey(name: 'message')
  final String? message;

  ErrorResponseModel({this.statusCode, this.message});

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ErrorResponseModelToJson(this);

  @override
  ErrorResponseModel fromJson(Map<String, dynamic> json) =>
      ErrorResponseModel.fromJson(json);

  @override
  List<Object?> get props => [message, statusCode];
}

// @JsonSerializable()
// class DetailsModel extends JsonModel<DetailsModel> {
//   @JsonKey(name: 'errors')
//   Map<String, List<String>>? errors;
//
//   DetailsModel({this.errors});
//
//   factory DetailsModel.fromJson(Map<String, dynamic> json) =>
//       _$DetailsModelFromJson(json);
//
//   @override
//   Map<String, dynamic> toJson() => _$DetailsModelToJson(this);
//
//   @override
//   DetailsModel fromJson(Map<String, dynamic> json) =>
//       DetailsModel.fromJson(json);
//
//
//   @override
//   List<Object?> get props => [errors];
// }
