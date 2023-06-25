import 'package:flutter/material.dart';

import '../../hadeth_details/hadeth_details.dart';
import 'hadeth_model_class.dart';

class HadethTitleWidget extends StatelessWidget {
  Hadeth hadeth;

  HadethTitleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadethDetails.routeName,
          arguments: hadeth,
        );
      },
      child: Container(
        child: Text(hadeth.title,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center),
      ),
    );
  }
}
