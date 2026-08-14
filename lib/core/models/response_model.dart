import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter_template/core/models/json_model.dart';

@JsonSerializable(genericArgumentFactories: true)
abstract class ResponseModel<T, D extends Object> extends JsonModel<T> {
  @JsonKey(name: 'statusCode')
  late final int? statusCode;

  @JsonKey(name: 'message')
  late final String? message;

  @JsonKey(name: 'data')
  late final D? data;
}

