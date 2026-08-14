

import 'package:my_flutter_template/core/network/netwok_info.dart';
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/features/startUp/splash/domain/repositories/lang_repository.dart';

@Injectable()
class ChangeLangUseCase extends UseCase<bool, String> {
  final LangRepository langRepository;

  ChangeLangUseCase({required this.langRepository, required super.networkInfo});

  @override
  UseCaseResponse<bool> call(String params) async {
    return langRepository.changeLang(langCode: params);
  }
}
