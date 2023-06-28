import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.enableEnglish();
            },
            child: provider.isEngishEnable()
                ? getSelectedWidget('English', context)
                : getUnSelectedWidget('English', context),
          ),
          InkWell(
            onTap: () {
              provider.enableArabic();
            },
            child: provider.isEngishEnable()
                ? getUnSelectedWidget('العربية', context)
                : getSelectedWidget('العربية', context),
          ),
        ],
      ),
    );
  }

  Widget getSelectedWidget(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: Theme.of(context).accentColor,
                )),
        Icon(Icons.check, color: Theme.of(context).accentColor),
      ],
    );
  }

  Widget getUnSelectedWidget(String title, BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.bodyText2);
  }
}
