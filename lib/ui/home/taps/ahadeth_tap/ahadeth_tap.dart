import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/assets_app.dart';
import 'package:islami/ui/models/hadeth_model.dart';

import 'hadeth_details.dart';

class AhadethTap extends StatefulWidget {
  @override
  State<AhadethTap> createState() => _AhadethTapState();
}

class _AhadethTapState extends State<AhadethTap> {
  List <HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            options: CarouselOptions(
              height: double.infinity,
            ),
            items: allAhadeth.map((hadeth) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        HadethDetails.routeName,
                        arguments: HadethModel(
                            title: hadeth.title, content: hadeth.content),
                      );
                    },
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(AppAssets.hadethImage),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              textDirection: TextDirection.rtl,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(30),
                                  child: Text(hadeth.title, style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                    color: Colors.black,
                                  ), textAlign: TextAlign.center,),
                                ),
                                Text(hadeth.content.first, style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                  color: Colors.black,),
                                  textAlign: TextAlign.center,
                                  maxLines: 11,
                                  overflow: TextOverflow.ellipsis,

                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }

  loadHadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt")
        .then((file) {
      List <String> ahadeth = file.trim().split("#");
      for (String data in ahadeth) {
        List<String> lines = data.trim().split("\n");
        String title = lines[0];
        lines.removeAt(0);
        List <String> content = lines;
        HadethModel hadethModel = HadethModel(title: title, content: content);
        allAhadeth.add(hadethModel);
      }
      setState(() {

      });
    },);
  }
}
