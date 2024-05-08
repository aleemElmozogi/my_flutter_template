import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:my_flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:my_flutter_template/features/auth/domain/repositories/user_info_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserInfoUsecase implements UseCase<UserEntity, NoParams> {
  final UserInfoRepository userInfoRepository;

  UserInfoUsecase({required this.userInfoRepository});

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async =>
      await userInfoRepository.fetch().then((value) => value.map((r) =>
          UserEntity(
              userId: r.userId,
              accountType: r.accountType,
              userName: r.userName,
              userEmail: r.userEmail,
              profileImageUrl: (r.profileImageUrl == null ||
                      (r.profileImageUrl ?? '').isEmpty)
                  ? 'https://avatar.iran.liara.run/public/49'
                  : (r.profileImageUrl ?? '').replaceAll('\\\\', '/'),
              phoneNumber: r.phoneNumber)));
}
