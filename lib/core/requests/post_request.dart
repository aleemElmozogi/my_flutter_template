import 'package:my_flutter_template/core/enums/post_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_request.g.dart';

@JsonSerializable(createFactory: false)
class PostRequest {
  final String? id;
  final num? pageNumber;
  final String? search;

  PostRequest({this.id, this.pageNumber, this.search});

  Map<String, dynamic> toJson() => _$PostRequestToJson(this);
}
