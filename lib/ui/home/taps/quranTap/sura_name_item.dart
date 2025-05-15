import 'package:flutter/material.dart';
import 'package:islami/assets_app.dart';

import '../../../models/sura_model.dart';

class SuraNameItem extends StatelessWidget {
  SuraModel model;

  SuraNameItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [Image.asset(AppAssets.suraNumber), Text("${model.index}")],
        ),
        SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.nameEn, style: Theme.of(context).textTheme.bodyLarge),
              Text(
                "${model.numOfVerses} Verses",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Text(model.nameAr, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
