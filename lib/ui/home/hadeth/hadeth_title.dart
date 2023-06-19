import 'package:flutter/material.dart';

class HadethTitleWidget extends StatelessWidget {
  String title;

  HadethTitleWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Text(title,
            style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
      ),
    );
  }
}
