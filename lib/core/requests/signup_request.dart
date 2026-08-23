import 'package:my_flutter_template/core/enums/account_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@JsonSerializable(createFactory: false, explicitToJson: true)
class SignupRequest {
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'Password')
  final String password;
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'imagePath', includeToJson: false)
  final String imagePath;
  @JsonKey(name: 'PhoneNumber')
  final String phoneNumber;
  @JsonKey(name: 'UserType', defaultValue: AccountTypeStatus.helper)
  final AccountTypeStatus? accountType;

  SignupRequest({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.accountType,
    required this.imagePath,
  });

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
