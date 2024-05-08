import 'package:my_flutter_template/features/auth/data/models/user_content_model.dart';

class UserEntity extends UserContentModel {
  UserEntity({
    required super.userId,
    required super.userName,
    required super.userEmail,
    required super.profileImageUrl,
    required super.phoneNumber,
    required super.accountType,
  });
  @override
  List<Object?> get props =>
      [userId, userName, userEmail, profileImageUrl, phoneNumber,accountType];
}
