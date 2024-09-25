import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/error/exceptions.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/features/startUp/splash/data/datasources/lang_local_data_source.dart';


import '../../domain/repositories/lang_repository.dart';

@Singleton(as: LangRepository)
class LangRepositoryImpl implements LangRepository {
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImpl({required this.langLocalDataSource});
  @override
  UseCaseResponse<bool> changeLang({required String langCode}) async {
    try {
      final langIsChanged =
          await langLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on CacheException catch(e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  UseCaseResponse<String> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return Right(langCode);
    } on CacheException catch(e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
