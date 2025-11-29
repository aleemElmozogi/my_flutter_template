
import 'package:my_flutter_template/core/models/response_model.dart';
import 'package:my_flutter_template/features/authentication/auth/data/models/credentials_content_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credentials_model.g.dart';

@JsonSerializable()
class CredentialsModel
    extends ResponseModel<CredentialsModel, CredentialsContentModel> {
  CredentialsModel();

  factory CredentialsModel.fromJson(Map<String, dynamic> json) =>
      _$CredentialsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CredentialsModelToJson(this);

  @override
  CredentialsModel fromJson(Map<String, dynamic> json) =>
      CredentialsModel.fromJson(json);

  @override
  List<Object?> get props => [];
}
