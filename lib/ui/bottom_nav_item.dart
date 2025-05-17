import 'package:flutter/material.dart';
import 'package:islami/app_color.dart';
import 'package:islami/assets_app.dart';

class BottomNavItem extends StatefulWidget {
  Function onChange;

  BottomNavItem({required this.onChange});

  @override
  State<BottomNavItem> createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      backgroundColor: AppColor.primaryGold,
      onTap: (value) {
        setState(() {
          selectedIndex = value;
          widget.onChange(selectedIndex);
        });
      },
      items: [
        BottomNavigationBarItem(
          backgroundColor: AppColor.primaryGold,
          icon: ImageIcon(AssetImage(AppAssets.icQuran)),
          label: "Quran",
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColor.primaryGold,
          icon: ImageIcon(AssetImage(AppAssets.icHadith)),
          label: "Hadith",
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColor.primaryGold,
          icon: ImageIcon(AssetImage(AppAssets.icSebha)),
          label: "Sebha",
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColor.primaryGold,
          icon: ImageIcon(AssetImage(AppAssets.icRadio)),
          label: "Radio",
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColor.primaryGold,
          icon: ImageIcon(AssetImage(AppAssets.icTime)),
          label: "Time",
        ),
      ],
    );
  }
}
