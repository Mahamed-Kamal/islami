import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';

  void enableDarkMode() {
    themeMode = ThemeMode.dark;
    notifyListeners();
  }

  void enableLightMode() {
    themeMode = ThemeMode.light;
    notifyListeners();
  }

  String getBackgroundImage() {
    return themeMode == ThemeMode.light
        ? 'assets/images/main_background.png'
        : 'assets/images/dark_main_background.png';
  }

  bool isDarkEnabled() {
    return themeMode == ThemeMode.dark;
  }

  void enableEnglish() {
    languageCode = 'en';
    notifyListeners();
  }

  void enableArabic() {
    languageCode = 'ar';
    notifyListeners();
  }

  bool isEngishEnable() {
    return languageCode == 'en';
  }
}
