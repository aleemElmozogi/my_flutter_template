import 'package:my_flutter_template/features/auth/data/models/user_auth_model.dart';

class UserAuthEntity extends UserAuthContentModel {
  const UserAuthEntity({
    required super.pin,
    required super.email,
  });
  @override
  List<Object?> get props => [pin, email];
}
