import 'package:flutter/material.dart';
import 'package:islami/assets_app.dart';

class CustomScaffoldContainer extends StatelessWidget {
  int selectedIndex;
  Widget child;

  CustomScaffoldContainer({
    super.key,
    required this.selectedIndex,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(getBackGroundImageName()),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }

  // Methods
  String getBackGroundImageName() {
    switch (selectedIndex) {
      case 0:
        return AppAssets.imageQuran;
      case 1:
        return AppAssets.imageHadith;
      case 2:
        return AppAssets.imageSebha;
      case 3:
        return AppAssets.imageRadio;
      case 4:
        return AppAssets.imageTime;
      default:
        return AppAssets.imageQuran;
    }
  }
}
