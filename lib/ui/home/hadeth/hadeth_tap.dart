import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home/hadeth/hadeth_model_class.dart';

import 'hadeth_title.dart';

class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Hadeth> allHadethList = [];

  @override
  Widget build(BuildContext context) {
    if (allHadethList.isEmpty) {
      readHadethFile();
    }
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Image.asset('assets/images/hadeth_header_image.png')),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 2,
        ),
        Text('Hadeth Number',
            style: TextStyle(
              fontSize: 24,
            )),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 2,
        ),
        Expanded(
            flex: 3,
            child: allHadethList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
              itemBuilder: (context, index) =>
                        HadethTitleWidget(allHadethList[index]),
                    separatorBuilder: (context, index) => Divider(
                      color: Theme.of(context).primaryColor,
                      thickness: 1,
                    ),
                    itemCount: allHadethList.length,
                  ))
      ],
    );
  }

  void readHadethFile() async {
    List<Hadeth> hadethList = [];

    var fileContent = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> spliteedContent = fileContent.split('#');
    for (int i = 0; i < spliteedContent.length; i++) {
      String singleHadethContent = spliteedContent[i];
      List<String> lines = singleHadethContent.trim().split('\n');
      String title = lines[0];
      lines.removeAt(0);
      String content = lines.join('\n');
      Hadeth hadeth = Hadeth(title, content);
      hadethList.add(hadeth);
    }
    allHadethList = hadethList;
    setState(() {});
  }
}
