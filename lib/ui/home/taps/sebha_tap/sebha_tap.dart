import 'package:flutter/material.dart';
import 'package:islami/assets_app.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  double angle = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد الله",
    "الله اكبر",
  ];

  int index = 0;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16,),
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ", style: TextStyle(
            fontSize: 36,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ), textAlign: TextAlign.center,),
          SizedBox(height: 12,),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 58),
                  child: Image.asset(AppAssets.sebhaHeader,)),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: heightScreen * .10),
                      child: Transform.rotate(
                        angle: angle,
                        child: GestureDetector(
                            onTap: () {
                              _sebhaClick();
                            },
                            child: Image.asset(AppAssets.sebhaBody,
                              height: heightScreen * .42,)),
                      )),
                  Column(
                    children: [
                      SizedBox(height: heightScreen * .09,),
                      Text(azkar[index], style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,

                      ),),
                      SizedBox(height: heightScreen * .04,),
                      Text("$counter", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),),
                    ],
                  ),
                ],
              ),

            ],
          ),

        ],
      ),
    );
  }

  _sebhaClick() {
    counter++;
    angle += 11;
    if (counter == 34) {
      counter = 0;
      index = (index + 1) % 3;
    }
    setState(() {});
  }
}
