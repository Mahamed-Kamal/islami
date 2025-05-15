import 'package:flutter/material.dart';
import 'package:islami/ui/bottom_nav_item.dart';
import 'package:islami/ui/home/taps/hadith_tap.dart';
import 'package:islami/ui/home/taps/quranTap/quran_tap.dart';
import 'package:islami/ui/home/taps/radio_tap.dart';
import 'package:islami/ui/home/taps/sebha_tap.dart';
import 'package:islami/ui/home/taps/time_tap.dart';

import '../common/custom_scaffold_container.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home_Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> taps = [
      QuranTap(),
      HadithTap(),
      SebhaTap(),
      RadioTap(),
      TimeTap(),
    ];
    return CustomScaffoldContainer(
      selectedIndex: selectedIndex,
      child: Scaffold(
        bottomNavigationBar: BottomNavItem(
          onChange: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        body: taps[selectedIndex],
      ),
    );
  }
}
