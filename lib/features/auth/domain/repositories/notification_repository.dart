import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/failures.dart';


abstract class NotificationRepository {
  Future<Either<Failure, void>> setUpRemoteNotification();
  Future<Either<Failure, void>> subscribeToTopic(String topic);
  Future<Either<Failure, void>> unSubscribeToTopic(String topic);
  Future<Either<Failure, bool>> isSubscribedToTopic();
}
