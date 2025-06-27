import 'dart:convert';

import 'package:my_flutter_template/core/models/json_model.dart';
import 'package:my_flutter_template/core/models/response_model.dart';
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

  @JsonKey(defaultValue: '')
  final String accessToken;
  @JsonKey(defaultValue: '')
  final String refreshToken;
  @JsonKey(name: 'userProfile')
  final UserContentModel user;
  factory CredentialsContentModel.fromJson(Map<String, dynamic> json) =>
      _$CredentialsContentModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CredentialsContentModelToJson(this);

  factory CredentialsContentModel.fromStorage(String data) =>
      CredentialsContentModel.fromJson(json.decode(data));

  @override
  CredentialsContentModel fromJson(Map<String, dynamic> json) =>
      CredentialsContentModel.fromJson(json);

  @override
  List<Object?> get props => [];
}
