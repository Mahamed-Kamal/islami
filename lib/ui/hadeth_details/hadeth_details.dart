import 'package:flutter/material.dart';
import 'package:islami/ui/home/hadeth/hadeth_model_class.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'Hadeth-Details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/main_background.png'),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title, style: TextStyle(fontSize: 25)),
        ),
        body: Column(
          children: [
            Expanded(
                child: Card(
              margin: EdgeInsets.all(24),
              elevation: 24,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: SingleChildScrollView(
                child: Text(
                  args.content,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
