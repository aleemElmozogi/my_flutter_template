import 'package:equatable/equatable.dart';

abstract class JsonModel<T> extends Equatable {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
