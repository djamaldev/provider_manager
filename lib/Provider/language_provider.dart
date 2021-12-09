import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  bool isEn = true;

  Map<String, Object> textsAr = {
    'reminder': 'ضغطت على الزر عدة مرات',
    'arabic': 'العربية',
    'english': 'الانجليزية'
  };
  Map<String, Object> textsEn = {
    'reminder': 'You have pushed the button this many times:',
    'arabic': 'Arabic',
    'english': 'English'
  };

  changeLan(bool lan) async {
    isEn = lan;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isEn', isEn);
    notifyListeners();
  }

  getLan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEn = prefs.getBool('isEn') ?? true;
    notifyListeners();
  }

  Object? getTexts(String txt) {
    if (isEn == true) return textsEn[txt];
    return textsAr[txt];
  }
}
