import 'package:flutter/material.dart';
import 'package:islami/app_color.dart';
import 'package:islami/assets_app.dart';
import 'package:islami/ui/models/sura_model.dart';

class CardItem extends StatelessWidget {
  SuraModel model;

  CardItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.primaryGold,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  model.nameEn,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                Text(
                  model.nameAr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "${model.numOfVerses} Verses",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(AppAssets.suraCard),
        ],
      ),
    );
  }
}
