import 'package:my_flutter_template/core/enums/account_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_content_model.freezed.dart';
part 'user_content_model.g.dart';

@freezed
abstract class UserContentModel with _$UserContentModel {
  const factory UserContentModel({
    @JsonKey(name: 'fullName') @Default('') String userName,
    @JsonKey(name: 'email') @Default('') String userEmail,
    @JsonKey(name: 'imageUrl') @Default('') String profileImageUrl,
    @JsonKey(name: 'phoneNumber') @Default('') String phoneNumber,
    @JsonKey(name: 'walletTotal') @Default('0') String walletTotal,
    @JsonKey(name: 'accountType')
    @Default(AccountTypeStatus.helper)
    AccountTypeStatus accountType,
  }) = _UserContentModel;

  factory UserContentModel.fromJson(Map<String, dynamic> json) =>
      _$UserContentModelFromJson(json);
}
