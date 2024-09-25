
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/features/startUp/splash/domain/repositories/lang_repository.dart';


@lazySingleton
class GetSavedLangUseCase implements UseCase<String, NoParams> {
  final LangRepository langRepository;

  GetSavedLangUseCase({required this.langRepository});

  @override
  UseCaseResponse<String> call(NoParams params) async =>
      await langRepository.getSavedLang();
}
