import 'dart:convert';

import 'package:my_flutter_template/core/models/json_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_student_info_content_model.g.dart';

@JsonSerializable()
class StudentInfoContentModel extends JsonModel<StudentInfoContentModel> {
  StudentInfoContentModel({
    required this.studentId,
    required this.studentCode,
    required this.fullName,
    required this.phoneNumber,
  });

  factory StudentInfoContentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentInfoContentModelFromJson(json);

  factory StudentInfoContentModel.fromStorage(String data) =>
      StudentInfoContentModel.fromJson(
        json.decode(data) as Map<String, dynamic>,
      );

  @JsonKey(defaultValue: '')
  final String studentId;
  @JsonKey(defaultValue: '')
  final String fullName;
  @JsonKey(defaultValue: '')
  final String studentCode;
  @JsonKey(defaultValue: '')
  final String phoneNumber;

  @override
  Map<String, dynamic> toJson() => _$StudentInfoContentModelToJson(this);

  @override
  StudentInfoContentModel fromJson(Map<String, dynamic> json) =>
      StudentInfoContentModel.fromJson(json);

  @override
  List<Object?> get props => [studentId, studentCode, fullName, phoneNumber];
}
