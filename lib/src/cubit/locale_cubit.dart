import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project33/src/resources/language_cashe_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());
  Future<void>getSavedLanguage()async{
    final cashedLanguageCode=await LanguageCasheHelper().getCashedLanguageCode();
  emit(ChangeLocalState(locale: Locale(cashedLanguageCode)));
  }
  Future<void>changeLanguage(String languageCode)async{
    await LanguageCasheHelper().casheLanguageCode(languageCode);
    emit(ChangeLocalState(locale: Locale(languageCode)));

  }
}
