import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/network/netwok_info.dart';
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/features/authentication/auth/domain/repositories/notification_repository.dart';

@lazySingleton
class SubscribeToTopicUsecase extends UseCase<void, NoParams> {
  final NotificationRepository notificationRepository;

  SubscribeToTopicUsecase(
      {required this.notificationRepository, required NetworkInfo networkInfo})
      : super(networkInfo: networkInfo);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return notificationRepository.subscribeToTopic('fassila');
  }
}
