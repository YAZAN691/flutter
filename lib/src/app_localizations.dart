import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale? locale;

  AppLocalizations({required this.locale});
static AppLocalizations? of(BuildContext context){
  return Localizations.of<AppLocalizations>(context,AppLocalizations);
}
static LocalizationsDelegate<AppLocalizations> delegate=_AppLocalizationsDelegate() ;
late Map<String,String>_localizedStrings;
Future loadJsonLanguage() async{
  String jsonString= await rootBundle.loadString('lib/src/assets/lang/${locale!.languageCode}.json');
  Map <String,dynamic>jsonMap=json.decode(jsonString);
  _localizedStrings=jsonMap.map((key,value){
    return MapEntry(key, value.toString());
  });

}
String translate(String key)=> _localizedStrings[key]??"";
}
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations>{
  @override
  bool isSupported(Locale locale) {
    return ['en','ar'].contains(locale.languageCode);
  }
  @override
  Future<AppLocalizations> load(Locale locale) async {
   AppLocalizations appLocalizations=AppLocalizations(locale: locale);
   await appLocalizations.loadJsonLanguage();
   return appLocalizations;
    
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }

}
extension TranslateX on String{
  String tr(BuildContext context){
    return AppLocalizations.of(context)!.translate(this);
  }
}
