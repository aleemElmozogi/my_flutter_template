import 'package:json_annotation/json_annotation.dart';

part 'create_post_request.g.dart';

@JsonSerializable(createFactory: false, explicitToJson: true)
class CreatePostRequest {
  @JsonKey(name: 'Title')
  final String title;

  @JsonKey(name: 'BodyDescription')
  final String? description;

  @JsonKey(name: 'ProjectId')
  final String projectId;

  @JsonKey(includeToJson: false)
  final String imagePath;

  @JsonKey(name: 'EndDate')
  final String endDate;

  @JsonKey(name: 'StartDate')
  final String startDate;

  @JsonKey(name: 'Longitude')
  final String longitude;

  @JsonKey(name: 'Latitude')
  final String latitude;
  @JsonKey(name: 'AreaId')
  final int areaID;

  CreatePostRequest({
    required this.title,
    this.description,
    required this.projectId,
    required this.imagePath,
    required this.endDate,
    required this.startDate,
    required this.longitude,
    required this.latitude,
    required this.areaID,
  });

  Map<String, dynamic> toJson() => _$CreatePostRequestToJson(this);
}
