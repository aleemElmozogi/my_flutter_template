import 'package:my_flutter_template/core/models/json_model.dart';
import 'package:my_flutter_template/core/utils/network_method.dart';
import 'package:injectable/injectable.dart';

typedef ResponseModelCreator<R extends JsonModel> = R Function();

abstract class ApiConsumer {
  Future<T> request<T extends JsonModel>(
      ResponseModelCreator<T> responseCreator,
      {required String path,
      required NetworkMethod method,
      bool formDataIsEnabled = false,
      Map<String, String> header = const {},
      Map<String, dynamic> body = const {},
      Map<String, dynamic> mockResponse = const {},
      Map<String, dynamic> queryParameters = const {},
      required String authorization});
}
