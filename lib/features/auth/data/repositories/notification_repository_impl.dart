import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/exceptions.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/localStorage/loacal_storage.dart';
import 'package:my_flutter_template/features/auth/domain/repositories/notification_repository.dart';
import 'package:injectable/injectable.dart';
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
    try {
      // await notificationDataSource.setUpRemoteNotification();
      return const Right('sent');
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> isSubscribedToTopic() async {
    try {
      final value =await localStorage.isSubscribeToNotificationTopic;
      return Right(value);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> subscribeToTopic(topic) async {
    try {
      if (!await localStorage.isSubscribeToNotificationTopic) {
        // await notificationDataSource.subscribeToTopic(topic);
      }
      await localStorage.subscribeToNotificationTopic();
      return const Right("sent");
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> unSubscribeToTopic(topic) async {
    try {
      // await notificationDataSource.unSubscribeToTopic(topic);
      await localStorage.unSubscribeToNotificationTopic();
      return const Right('sent');
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
