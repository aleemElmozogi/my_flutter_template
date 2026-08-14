import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable(createFactory: false)
class LoginRequest {
  final String email;
  final String pin;

  LoginRequest({required this.email, required this.pin});

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
