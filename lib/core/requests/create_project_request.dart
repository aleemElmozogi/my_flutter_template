import 'package:json_annotation/json_annotation.dart';

part 'create_project_request.g.dart';

@JsonSerializable(createFactory: false)
class CreateProjectRequest {
  @JsonKey(name: 'Title')
  final String title;
  @JsonKey(name: 'Description')
  final String description;
  @JsonKey(name: 'CityId')
  final int city;

  CreateProjectRequest(
      {required this.title, required this.description, required this.city});

  Map<String, dynamic> toJson() => _$CreateProjectRequestToJson(this);
}
