
import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:my_flutter_template/features/auth/domain/repositories/notification_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';

@lazySingleton
class IsSubscribedToTopicUsecase implements UseCase<bool, NoParams> {
  final NotificationRepository notificationRepository;

  IsSubscribedToTopicUsecase({required this.notificationRepository});
  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return notificationRepository.isSubscribedToTopic();
  }
}
