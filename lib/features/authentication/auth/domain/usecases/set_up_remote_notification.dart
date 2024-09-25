import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/features/authentication/auth/domain/repositories/notification_repository.dart';


@lazySingleton
class SetUpRemoteNotificationUsecase implements UseCase<void, NoParams> {
  final NotificationRepository notificationRepository;

  SetUpRemoteNotificationUsecase({required this.notificationRepository});
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return notificationRepository.setUpRemoteNotification();
  }
}
