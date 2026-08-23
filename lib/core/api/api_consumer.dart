import 'package:my_flutter_template/core/models/json_model.dart';
import 'package:my_flutter_template/core/utils/network_method.dart';

typedef ResponseModelCreator<R extends JsonModel<dynamic>> = R Function();

abstract class ApiConsumer {
  Future<T> request<T extends JsonModel<dynamic>>(
    ResponseModelCreator<T> responseCreator, {
    required String path,
    required NetworkMethod method,
    Map<String, String> header = const {},
    Map<String, dynamic> body = const {},
    Map<String, dynamic> mockResponse = const {},
    Map<String, dynamic> queryParameters = const {},
    required String authorization,
  });
}
