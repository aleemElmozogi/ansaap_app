import 'package:ansaap_app/core/usecases/usecase.dart';
import 'package:ansaap_app/core/utils/app_locale.dart';
import 'package:ansaap_app/core/utils/app_strings.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ansaap_app/features/startUp/splash/domain/usecases/change_lang.dart';
import 'package:ansaap_app/features/startUp/splash/domain/usecases/get_saved_lang.dart';

part 'locale_state.dart';

@Injectable()
class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;
  LocaleCubit(
      {required this.getSavedLangUseCase, required this.changeLangUseCase})
      : super(const ChangeLocaleState(AppLocale.ar)) {
    getSavedLang();
  }

  String currentLangCode = AppStrings.englishCode;

  Future<void> getSavedLang() async {
    final response = await getSavedLangUseCase(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = value;
      emit(ChangeLocaleState(
          Locale(value.split(',').first, value.split(',').last)));
    });
  }

  Future<void> changeLang(Locale locale) async {
    final response =
        await changeLangUseCase('${locale.languageCode},${locale.countryCode}');
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = locale.languageCode;
      emit(ChangeLocaleState(locale));
    });
  }
}
