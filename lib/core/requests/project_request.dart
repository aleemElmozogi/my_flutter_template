import 'package:json_annotation/json_annotation.dart';

part 'project_request.g.dart';

@JsonSerializable(createFactory: false)
class ProjectRequest {
  final num? pageNumber;
  final String? search;
  final bool fetchAllProjects;

  ProjectRequest({this.pageNumber, this.search, this.fetchAllProjects = false});

  Map<String, dynamic> toJson() => _$ProjectRequestToJson(this);
}
