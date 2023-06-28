import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
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
              provider.enableLightMode();
            },
            child: provider.isDarkEnabled()
                ? getUnSelectedWidgt(
                    AppLocalizations.of(context)!.light, context)
                : getSelectedWidgt(
                    AppLocalizations.of(context)!.light, context),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              provider.enableDarkMode();
            },
            child: provider.isDarkEnabled()
                ? getSelectedWidgt(AppLocalizations.of(context)!.dark, context)
                : getUnSelectedWidgt(
                    AppLocalizations.of(context)!.dark, context),
          ),
        ],
      ),
    );
  }

  Widget getSelectedWidgt(String title, BuildContext context) {
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

  Widget getUnSelectedWidgt(String title, BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.bodyText2);
  }
}
