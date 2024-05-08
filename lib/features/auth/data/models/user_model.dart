import 'package:my_flutter_template/core/models/response_model.dart';
import 'package:my_flutter_template/features/auth/data/models/user_content_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends ResponseModel<UserModel,
    UserContentModel> {
  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  UserModel fromJson(Map<String, dynamic> json) =>
      UserModel.fromJson(json);

  @override
  List<Object?> get props => [];
}
