

import 'package:my_flutter_template/core/api/api_consumer.dart';
import 'package:my_flutter_template/core/api/end_points.dart';
import 'package:my_flutter_template/core/localStorage/loacal_storage.dart';
import 'package:my_flutter_template/core/models/message_model.dart';
import 'package:my_flutter_template/core/utils/network_method.dart';
import 'package:my_flutter_template/features/auth/config/dto/user_auth_dto.dart';
import 'package:injectable/injectable.dart';

abstract class AuthDataSource {
  Future<String> auth(UserAuthDto userDto);
}
@Singleton(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final ApiConsumer apiConsumer;
  final LocalStorage localStorage;

  AuthDataSourceImpl({
    required this.apiConsumer,
    required this.localStorage,
  });

  @override
  Future<String> auth(userDto) async {
    final response = await apiConsumer.request(() => MessageModel(),
        path: EndPoints.signIn,
        method: NetworkMethod.post,
        queryParameters: userDto.toJson(),
        authorization: await localStorage.publicToken, // This is empty
        mockResponse: {"statusCode": 200, "content": 'Token-Mock', "message": "assss"});
    await localStorage.refreshAccessToken(response.content ?? '');
    return response.content ?? '';
  }
}
