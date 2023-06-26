import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/ui/hadeth_details/hadeth_details.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/my_theme_data/my_theme_data.dart';
import 'package:islami/ui/splash/splash_screen.dart';
import 'package:islami/ui/sura_details/sura_details.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (buildContext) => SplashScreen(),
        HomeScreen.routeName: (buildContext) => HomeScreen(),
        SuraDetails.routeName: (buildContext) => SuraDetails(),
        HadethDetails.routeName: (buildContext) => HadethDetails(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: MyThemeData.themeMode,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // arabic
      ],
      locale: Locale('en'),
    );
  }
}
