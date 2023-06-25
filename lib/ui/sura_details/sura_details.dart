import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/sura_details/verse_content.dart';

import '../my_theme_data/my_theme_data.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'Sura-Details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> chapterContent = [];

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsScreenArgs;
    if (chapterContent.isEmpty) {
      readFile(args.index);
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(MyThemeData.themeMode == ThemeMode.light
            ? 'assets/images/main_background.png'
            : 'assets/images/dark_main_background.png'),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Column(
          children: [
            Expanded(
                child: Card(
              margin: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              elevation: 24,
              child: chapterContent.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      itemBuilder: (buildContext, index) =>
                          VerseContent(chapterContent[index]),
                      separatorBuilder: (buildContext, index) => Divider(
                        thickness: 1,
                        color: Theme.of(context).accentColor,
                      ),
                      itemCount: chapterContent.length,
                    ),
            ))
          ],
        ),
      ),
    );
  }

  void readFile(int chapterIndex) async {
    String text =
        await rootBundle.loadString('assets/files/${chapterIndex + 1}.txt');
    chapterContent = text.split('\n');
    setState(() {});
  }
}

class SuraDetailsScreenArgs {
  String title;
  int index;

  SuraDetailsScreenArgs(this.title, this.index);
}
