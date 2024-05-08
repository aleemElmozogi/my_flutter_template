import 'package:my_flutter_template/features/auth/data/models/user_auth_model.dart';

class UserAuthDto extends UserAuthContentModel {
  const UserAuthDto({
    required super.email,
    required super.pin,
  });

  @override
  Map<String, dynamic> toJson() => {
        "email": email,
        "pin": pin,
      };
  @override
  List<Object?> get props => [email, pin];
}
