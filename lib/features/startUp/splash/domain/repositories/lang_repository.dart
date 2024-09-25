
import 'package:my_flutter_template/core/usecases/usecase.dart';

abstract class LangRepository {
  UseCaseResponse<bool> changeLang({required String langCode});
  UseCaseResponse<String> getSavedLang();
}
