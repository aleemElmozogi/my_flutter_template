import 'package:my_flutter_template/core/enums/contribution_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'donation_request.g.dart';

@JsonSerializable(createFactory: false, explicitToJson: true)
class DonationRequest {
  @JsonKey()
  final double amount;
  @JsonKey()
  final String projectId;
  @JsonKey()
  final ContributionType contributionType;

  DonationRequest(
      {required this.amount,
      required this.projectId,
      required this.contributionType});

  Map<String, dynamic> toJson() => _$DonationRequestToJson(this);
}
