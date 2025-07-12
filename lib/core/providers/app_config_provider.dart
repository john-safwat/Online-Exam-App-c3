import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_c3/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class AppConfigProvider extends ChangeNotifier {
  SharedPreferences sharedPreferences;

  AppConfigProvider({required this.sharedPreferences});

  String selectedLocale = Constants.enLocaleKey;

  bool isEn() => selectedLocale == Constants.enLocaleKey;

  Future<void> setSelectedLocale() async {
    var currentLocale =
        sharedPreferences.getString(Constants.localeKey) ??
        Constants.enLocaleKey;
    selectedLocale = currentLocale;
  }

  Future<void> changeLocale(String currentLocale) async {
    if (selectedLocale == currentLocale) return;
    selectedLocale = currentLocale;
    sharedPreferences.setString(Constants.localeKey, selectedLocale);
    notifyListeners();
  }
}
