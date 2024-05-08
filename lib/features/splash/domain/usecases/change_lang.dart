

import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:my_flutter_template/features/splash/domain/repositories/lang_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChangeLangUseCase implements UseCase<bool, String> {
  final LangRepository langRepository;

  ChangeLangUseCase({required this.langRepository});

  @override
  UseCaseResponse<bool> call(String langCode) async =>
      await langRepository.changeLang(langCode: langCode);
}
