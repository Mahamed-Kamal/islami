import 'package:flutter/material.dart';
import 'package:islami/app_color.dart';
import 'package:islami/cache/cache_helper.dart';
import 'package:islami/ui/home/home_screen.dart';

import 'ui/home/taps/ahadeth_tap/hadeth_details.dart';
import 'ui/home/taps/quranTap/sura_details/sura_details_screen.dart';
import 'ui/onboarding_screen/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColor.primaryGold),
        ),
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: TextTheme(
          bodySmall: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColor.primaryGold,
          selectedIconTheme: IconThemeData(color: Colors.white),
          unselectedIconTheme: IconThemeData(color: Colors.black),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
        ),
        useMaterial3: true,
      ),
      initialRoute:
          CacheHelper.getEligibility() == true
              ? HomeScreen.routeName
              : OnBoardingScreen.routeName,
      routes: {
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
    );
  }
}
