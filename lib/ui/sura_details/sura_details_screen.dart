import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_color.dart';
import 'package:islami/assets_app.dart';
import 'package:islami/ui/models/sura_model.dart';
import 'package:islami/ui/sura_details/sura_details_item.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "Sura-Details-Screen";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var suraModel = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(suraModel.index);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "${suraModel.nameEn}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.primaryGold,
          ),
        ),
        iconTheme: IconThemeData(color: AppColor.primaryGold),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
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
            padding: const EdgeInsets.all(26.0),
            child: Column(
              children: [
                Text(
                  "${suraModel.nameAr}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryGold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 48),
                Expanded(
                  child: ListView.separated(
                    itemBuilder:
                        (context, index) =>
                            SuraDetailsItem(verses: verses, index: index),
                    itemCount: verses.length,
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  loadSuraFile(int index) async {
    String textFile = await rootBundle.loadString("assets/files/${index}.txt");
    List<String> lines = textFile.split("\n");
    verses = lines;
    setState(() {});
  }
}
