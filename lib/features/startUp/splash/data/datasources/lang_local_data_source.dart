import 'package:my_flutter_template/core/localStorage/loacal_storage.dart';
import 'package:injectable/injectable.dart';

abstract class LangLocalDataSource {
  Future<bool> changeLang({required String langCode});
  Future<String> getSavedLang();
}

@Singleton(as: LangLocalDataSource)
class LangLocalDataSourceImpl implements LangLocalDataSource {
  final LocalStorage localStorage;

  LangLocalDataSourceImpl({required this.localStorage});
  @override
  Future<bool> changeLang({required String langCode}) async =>
      await localStorage.changeLang(langCode: langCode);

  @override
  Future<String> getSavedLang() async => await localStorage.getSavedLang();
}
