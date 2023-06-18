import 'package:flutter/material.dart';
import 'package:islami/ui/home/quran/quran_tap.dart';
import 'package:islami/ui/home/radio/radio_tap.dart';
import 'package:islami/ui/home/tasbeh/tasbeh_tap.dart';

import 'hadeth/hadeth_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home-Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTapIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/main_background.png'),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Islami'),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedTapIndex,
            onTap: (index) {
              setState(() {
                selectedTapIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: ImageIcon(AssetImage('assets/images/quran.png')),
                  label: 'Quran'),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: ImageIcon(AssetImage('assets/images/hadeth.png')),
                  label: 'Hadeth'),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: ImageIcon(AssetImage('assets/images/sebha.png')),
                  label: 'Tasbeh'),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: ImageIcon(AssetImage('assets/images/radio.png')),
                  label: 'Radio'),
            ]),
        body: tabs[selectedTapIndex],
      ),
    );
  }

  List<Widget> tabs = [
    QuranTap(),
    HadethTap(),
    TasbehTap(),
    RadioTap(),
  ];
}
