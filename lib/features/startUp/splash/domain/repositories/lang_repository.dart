
import 'package:ansaap_app/core/usecases/usecase.dart';

abstract class LangRepository {
  UseCaseResponse<bool> changeLang({required String langCode});
  UseCaseResponse<String> getSavedLang();
}
