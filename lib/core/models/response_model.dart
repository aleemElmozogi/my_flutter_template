import 'package:my_flutter_template/core/models/json_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(genericArgumentFactories: true)
abstract class ResponseModel<T, C extends Object> extends JsonModel<T> {

  @JsonKey(name: 'message', defaultValue: "")
  String? message;

  @JsonKey(name: 'content')
  C? content;
}
