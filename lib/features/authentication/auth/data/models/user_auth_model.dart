import 'package:equatable/equatable.dart';

class UserAuthContentModel extends Equatable {
  final String email;
  final String pin;
  const UserAuthContentModel({
    required this.email,
    required this.pin,
  });
  Map<String, dynamic> toJson() => {
        "email": email,
        "pin": pin,
      };
  factory UserAuthContentModel.fromJson(Map<String, dynamic> json) {
    return UserAuthContentModel(
      email: json['email'] as String,
      pin: json['pin'] as String,
    );
  }

  @override
  List<Object?> get props => [email, pin];
}
