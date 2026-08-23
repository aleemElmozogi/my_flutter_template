import 'package:json_annotation/json_annotation.dart';

part 'phone_number_request.g.dart';

@JsonSerializable(createFactory: false)
class PhoneNumberRequest {
  const PhoneNumberRequest({required this.phoneNumber});

  final String phoneNumber;

  Map<String, dynamic> toJson() => _$PhoneNumberRequestToJson(this);
}
