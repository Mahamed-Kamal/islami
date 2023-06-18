import 'package:flutter/material.dart';
import 'package:islami/ui/sura_details/sura_details.dart';

class VerseNameWidget extends StatelessWidget {
  String title;
  int index;

  VerseNameWidget(this.title, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetails.routeName,
          arguments: SuraDetailsScreenArgs(title, index),
        );
      },
      child: Container(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
