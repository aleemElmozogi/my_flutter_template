import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/exceptions.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/localStorage/loacal_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/features/authentication/auth/domain/repositories/notification_repository.dart';

@Singleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  // final NotificationDataSource notificationDataSource;
  final LocalStorage localStorage;

  NotificationRepositoryImpl({
    // required this.notificationDataSource,
    required this.localStorage,
  });

  @override
  Future<Either<Failure, void>> setUpRemoteNotification() async {
    return const Right('sent');
  }

  @override
  Future<Either<Failure, bool>> isSubscribedToTopic() async {
    final value = await localStorage.isSubscribeToNotificationTopic;
    return Right(value);
  }

  @override
  Future<Either<Failure, void>> subscribeToTopic(topic) async {
    if (!await localStorage.isSubscribeToNotificationTopic) {
      // await notificationDataSource.subscribeToTopic(topic);
    }
    await localStorage.subscribeToNotificationTopic();
    return const Right("sent");
  }

  @override
  Future<Either<Failure, void>> unSubscribeToTopic(topic) async {
    // await notificationDataSource.unSubscribeToTopic(topic);
    await localStorage.unSubscribeToNotificationTopic();
    return const Right('sent');
  }
}
