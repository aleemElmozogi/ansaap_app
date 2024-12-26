import 'package:dartz/dartz.dart';
import 'package:ansaap_app/core/error/exceptions.dart';
import 'package:ansaap_app/core/error/failures.dart';
import 'package:ansaap_app/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:ansaap_app/features/startUp/splash/data/datasources/lang_local_data_source.dart';

import '../../domain/repositories/lang_repository.dart';

@Singleton(as: LangRepository)
class LangRepositoryImpl implements LangRepository {
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImpl({required this.langLocalDataSource});
  @override
  UseCaseResponse<bool> changeLang({required String langCode}) async {
    final langIsChanged =
        await langLocalDataSource.changeLang(langCode: langCode);
    return Right(langIsChanged);
  }

  @override
  UseCaseResponse<String> getSavedLang() async {
    final langCode = await langLocalDataSource.getSavedLang();
    return Right(langCode);
  }
}
