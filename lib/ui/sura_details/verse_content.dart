import 'package:flutter/material.dart';

class VerseContent extends StatelessWidget {
  String content;

  VerseContent(this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(content,
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.center),
    );
  }
}
