import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/cache/cache_helper.dart';
import 'package:islami/ui/home/home_screen.dart';

import '../../app_color.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = "/";

  const OnBoardingScreen({super.key});

  // Methods
  Widget _buildImage(String assetName, [double width = 250]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 20,
      color: AppColor.primaryGold,
      fontWeight: FontWeight.bold,
    );
    const bottomStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColor.primaryGold,
    );

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: AppColor.primaryGold,
      ),
      titlePadding: EdgeInsets.only(bottom: 24),
      bodyTextStyle: bodyStyle,
      pageColor: Color(0xFF202020),
      imageFlex: 3,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      globalHeader: Image.asset("assets/images/onboarding_header.png"),
      dotsFlex: 2,
      dotsDecorator: DotsDecorator(
        color: Color(0xFF707070),
        activeColor: AppColor.primaryGold,
      ),
      showDoneButton: true,
      done: Text("Finish", style: bottomStyle),
      onDone: () {
        CacheHelper.saveEligibility();
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      next: Text("Next", style: bottomStyle),
      showNextButton: true,
      back: Text("Back", style: bottomStyle),
      showBackButton: true,
      globalBackgroundColor: Color(0xFF202020),
      pages: [
        PageViewModel(
          title: "Welcome To Islami App",
          image: _buildImage("onboarding1.png"),
          body: "",
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islami",
          image: _buildImage("onboarding2.png"),
          body: "We Are Very Excited To Have You In Our Community",
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran",
          image: _buildImage("onboarding3.png"),
          body: "Read, and your Lord is the Most Generous",
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bearish",
          image: _buildImage("onboarding4.png"),
          body: "Praise the name of your Lord, the Most High",
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Holy Quran Radio",
          image: _buildImage("onboarding5.png"),
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
