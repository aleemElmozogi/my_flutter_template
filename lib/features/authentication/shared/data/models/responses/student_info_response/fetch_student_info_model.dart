import 'package:my_flutter_template/core/models/response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'fetch_student_info_content_model.dart' show StudentInfoContentModel;

part 'fetch_student_info_model.g.dart';

@JsonSerializable()
class StudentInfoModel
    extends ResponseModel<StudentInfoModel, StudentInfoContentModel> {
  StudentInfoModel();

  factory StudentInfoModel.fromJson(Map<String, dynamic> json) =>
      _$StudentInfoModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StudentInfoModelToJson(this);

  @override
  StudentInfoModel fromJson(Map<String, dynamic> json) =>
      StudentInfoModel.fromJson(json);

  @override
  List<Object?> get props => [];
}
