import 'package:my_flutter_template/core/models/response_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/result_type.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel extends ResponseModel<MessageModel, String> {
  MessageModel();

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);


  @override
  Map<String, dynamic> toJson() => _$MessageModelToJson(this);

  @override
  MessageModel fromJson(Map<String, dynamic> json) {
    return MessageModel.fromJson(json);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
