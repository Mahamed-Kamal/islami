import 'package:flutter/material.dart';
import 'package:islami/app_color.dart';
import 'package:islami/assets_app.dart';
import 'package:islami/ui/models/hadeth_model.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "Hadeth-Details";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.title,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: AppColor.primaryGold),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.SuraDetailsCornorLeft),
                  Image.asset(AppAssets.SuraDetailsCornorRight),
                ],
              ),
              Spacer(),
              Image.asset(AppAssets.SuraDetailsBottomLogo),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Text.rich(
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: args.content.first,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryGold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
