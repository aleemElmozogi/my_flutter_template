import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:my_flutter_template/features/auth/domain/repositories/notification_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';

@lazySingleton
class SetUpRemoteNotificationUsecase implements UseCase<void, NoParams> {
  final NotificationRepository notificationRepository;

  SetUpRemoteNotificationUsecase({required this.notificationRepository});
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return notificationRepository.setUpRemoteNotification();
  }
}
