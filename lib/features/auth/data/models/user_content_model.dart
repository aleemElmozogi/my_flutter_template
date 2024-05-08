import 'package:my_flutter_template/core/enums/account_type.dart';
import 'package:my_flutter_template/core/models/json_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_content_model.g.dart';

@JsonSerializable()
class UserContentModel extends JsonModel<UserContentModel> {
  @JsonKey(name: 'id', defaultValue: '')
  final String? userId;
  @JsonKey(name: 'fullName', defaultValue: '')
  final String? userName;
  @JsonKey(name: 'email', defaultValue: '')
  final String? userEmail;
  @JsonKey(name: 'imageUrl', defaultValue: '')
  final String? profileImageUrl;
  @JsonKey(name: 'phoneNumber', defaultValue: '')
  final String? phoneNumber;
  @JsonKey(name: 'type', defaultValue: AccountTypeStatus.customer)
  final AccountTypeStatus? accountType;

  UserContentModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.profileImageUrl,
    this.phoneNumber,
    this.accountType,
  });

  factory UserContentModel.fromJson(Map<String, dynamic> json) =>
      _$UserContentModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserContentModelToJson(this);

  @override
  UserContentModel fromJson(Map<String, dynamic> json) =>
      UserContentModel.fromJson(json);

  @override
  List<Object?> get props =>
      [userId, userEmail, userName, profileImageUrl, phoneNumber];
}
