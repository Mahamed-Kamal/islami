import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightPrimaryColor = Color(0xFFB7935F);
  static const Color darkPrimaryColor = Color(0xFF141A2E);
  static const Color lightMainTextColor = Color(0xFF242424);
  static const Color darkMainTextColor = Color(0xFFF8F8F8);
  static const Color darkAccentColor = Color(0xFFFACC1D);
  static var lightTheme = ThemeData(
    cardColor: Colors.white,
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: lightPrimaryColor,
    accentColor: lightPrimaryColor,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: lightPrimaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      color: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 30,
        color: lightMainTextColor,
      ),
    ),
    textTheme: const TextTheme(
      headline3: TextStyle(
        //ex.Screen title
        color: lightMainTextColor,
        fontSize: 32,
      ),
      headline5: TextStyle(
        // sub headers
        color: lightMainTextColor,
        fontSize: 24,
      ),
      bodyText1: TextStyle(
        color: lightMainTextColor,
        fontSize: 24,
      ),
      bodyText2: TextStyle(
        color: lightMainTextColor,
        fontSize: 20,
      ),
    ),
  );
  static var darkTheme = ThemeData(
    cardColor: darkPrimaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: darkPrimaryColor,
    accentColor: darkAccentColor,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: darkAccentColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: darkAccentColor,
      unselectedItemColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      color: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 30,
        color: darkMainTextColor,
      ),
    ),
    textTheme: const TextTheme(
      headline3: TextStyle(
        //ex.Screen title
        color: darkMainTextColor,
        fontSize: 32,
      ),
      headline5: TextStyle(
        // sub headers
        color: darkMainTextColor,
        fontSize: 24,
      ),
      bodyText1: TextStyle(
        color: darkMainTextColor,
        fontSize: 24,
      ),
      bodyText2: TextStyle(
        color: darkMainTextColor,
        fontSize: 20,
      ),
    ),
  );

  static ThemeMode themeMode = ThemeMode.light;
}
