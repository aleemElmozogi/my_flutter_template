import 'package:my_flutter_template/core/api/api_consumer.dart';
import 'package:my_flutter_template/core/api/end_points.dart';
import 'package:my_flutter_template/core/localStorage/loacal_storage.dart';
import 'package:my_flutter_template/core/utils/network_method.dart';
import 'package:my_flutter_template/features/auth/data/models/user_content_model.dart';
import 'package:my_flutter_template/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

abstract class UserInfoDataSource {
  Future<UserContentModel> fetch();
}

@Singleton(as: UserInfoDataSource)
class UserInfoDataSourceImpl implements UserInfoDataSource {
  final ApiConsumer apiConsumer;
  final LocalStorage localStorage;

  UserInfoDataSourceImpl({
    required this.apiConsumer,
    required this.localStorage,
  });

  @override
  Future<UserContentModel> fetch() async {
    final response = await apiConsumer.request(() => UserModel(),
        path: EndPoints.getUserInfo,
        method: NetworkMethod.get,
        authorization: await localStorage.accessToken,
        mockResponse: {
          "statusCode": 201,
          "content": {
            "id": '3234234',
            "name": 'عبدالعليم المزوغي',
            "email": 'Elmozogiabdalalim@gmail.com',
            "imageUrl": "",
            "phoneNumber": "924397976",
            "accountType": 3
          },
          "message": "تمت العملية بنجاح"
        });
    return response.content ??
        UserContentModel(
            userId: '',
            userName: '',
            profileImageUrl: '',
            phoneNumber: '',
            userEmail: '');
  }
}
