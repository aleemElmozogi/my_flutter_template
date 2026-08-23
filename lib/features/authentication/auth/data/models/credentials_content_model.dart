import 'dart:convert';

import 'package:my_flutter_template/core/models/json_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_flutter_template/features/authentication/auth/data/models/user_content_model.dart';

part 'credentials_content_model.g.dart';

@JsonSerializable()
class CredentialsContentModel extends JsonModel<CredentialsContentModel> {
  CredentialsContentModel({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });
  factory CredentialsContentModel.fromJson(Map<String, dynamic> json) =>
      _$CredentialsContentModelFromJson(json);

  factory CredentialsContentModel.fromStorage(String data) =>
      CredentialsContentModel.fromJson(
        json.decode(data) as Map<String, dynamic>,
      );

  @JsonKey(defaultValue: '')
  final String accessToken;
  @JsonKey(defaultValue: '')
  final String refreshToken;
  @JsonKey(name: 'userProfile')
  final UserContentModel user;

  @override
  Map<String, dynamic> toJson() => _$CredentialsContentModelToJson(this);

  @override
  CredentialsContentModel fromJson(Map<String, dynamic> json) =>
      CredentialsContentModel.fromJson(json);

  @override
  List<Object?> get props => [];
}
