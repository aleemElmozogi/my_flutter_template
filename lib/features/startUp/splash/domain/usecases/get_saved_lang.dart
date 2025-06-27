import 'package:my_flutter_template/core/network/network_info.dart';
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/features/startUp/splash/domain/repositories/lang_repository.dart';

@lazySingleton
class GetSavedLangUseCase extends UseCase<String, NoParams> {
  final LangRepository langRepository;

  GetSavedLangUseCase(
      {required this.langRepository, required NetworkInfo networkInfo})
      : super(networkInfo: networkInfo);

  @override
  UseCaseResponse<String> call(NoParams params) async =>
      await langRepository.getSavedLang();
}
