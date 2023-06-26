import 'package:flutter/material.dart';

class TasbehTap extends StatefulWidget {
  @override
  State<TasbehTap> createState() => _TasbehTapState();
}

class _TasbehTapState extends State<TasbehTap> {
  int tasbehCounter = 0;
  int index = 0;
  double angle = 0;

  List<String> tasbeh = [
    'سبحان الله',
    'الحمد الله',
    'الله اكبر',
    'لا اله الا الله',
    'لا حول ولا قوه الا بالله '
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.11),
                child: Image.asset('assets/images/head_of_sebha.png'),
              ),
              InkWell(
                onTap: () {
                  onSebhaClick();
                },
                child: Padding(
                    padding: EdgeInsets.only(top: height * 0.11),
                    child: Transform.rotate(
                        angle: angle,
                        child: Image.asset('assets/images/body_of_sebha.png'))),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text('عدد التسبيحات',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5),
          SizedBox(
            height: 12,
          ),
          Container(
              padding: EdgeInsets.all(26),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Theme.of(context).primaryColor,
              ),
              child: Text('$tasbehCounter', textAlign: TextAlign.center)),
          SizedBox(
            height: 12,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Theme.of(context).primaryColor,
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                tasbeh[index],
                style: Theme.of(context).textTheme.headline5,
              )),
        ],
      ),
    );
  }

  void onSebhaClick() {
    angle += 360 / 33;
    tasbehCounter++;
    if (tasbehCounter % 33 == 0) {
      index++;
      tasbehCounter = 0;
    }
    if (index == tasbeh.length) {
      tasbehCounter = 0;
      index = 0;
    }
    setState(() {});
  }
}
