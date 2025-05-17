import 'package:flutter/material.dart';
import 'package:islami/app_color.dart';

class SuraDetailsItem extends StatelessWidget {
  List<String> verses;

  int index;

  SuraDetailsItem({required this.verses, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.primaryGold),
      ),
      child: Text.rich(
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        TextSpan(
          children: [
            TextSpan(
              text: verses[index],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryGold,
              ),
            ),
            TextSpan(
              text: "(${index + 1})",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryGold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
