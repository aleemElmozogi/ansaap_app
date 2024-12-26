

import 'package:ansaap_app/core/network/network_info.dart';
import 'package:ansaap_app/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:ansaap_app/features/startUp/splash/domain/repositories/lang_repository.dart';

@lazySingleton
class ChangeLangUseCase extends UseCase<bool, String> {
  final LangRepository langRepository;

  ChangeLangUseCase({required this.langRepository, required NetworkInfo networkInfo})
      : super(networkInfo: networkInfo);

  @override
  UseCaseResponse<bool> call(String langCode) async =>
      await langRepository.changeLang(langCode: langCode);
}
