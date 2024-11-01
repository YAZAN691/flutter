import 'package:shared_preferences/shared_preferences.dart';

class LanguageCasheHelper{
  Future<void>casheLanguageCode(String languageCode)async{
    final sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setString('LOCALE', languageCode);
  }
Future<String> getCashedLanguageCode()async{
  final sharedPreferences=await SharedPreferences.getInstance();
  final String? cachedLanguageCode=sharedPreferences.getString('LOCALE');
  if(cachedLanguageCode!=null){
    return cachedLanguageCode;
  }else{
    return "en";
  }
}
}