import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request.g.dart';

@JsonSerializable(createFactory: false)
class ForgetPasswordRequest {
  final String phone;
  final String newPassword;

  ForgetPasswordRequest({required this.phone, required this.newPassword});

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestToJson(this);
}
