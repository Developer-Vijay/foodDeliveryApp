import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shoppable_ecommerce_app/Auth/login.dart';

import '../constants.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  void onIntroEnd(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  // Asset Image Function
  // Widget buildImage(String assetName) {
  //   return Align(
  //     child: Image.asset('assets/images/$assetName.png', width: 180.0),
  //     alignment: Alignment.bottomCenter,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
        fontSize: 19,
        color: Apptheme.boardingTextColor,
        fontWeight: FontWeight.w600);
    const Decoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: Apptheme.boardinglabelColor),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: IntroductionScreen(
          onDone: () => onIntroEnd(context),
          showSkipButton: true,
          showNextButton: true,
          skipFlex: 0,
          nextFlex: 0,
          next: Icon(Icons.arrow_forward),
          skip: const Text('Skip'),
          done: Column(
            children: [
              Icon(Icons.arrow_forward),
              const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          pages: [
            PageViewModel(
              title: "Shoppable Ambassdor",
              body:
                  "Shoppable will give you a chance to earn more Become a retailer,distributor and master distributer and start high earning., ",
              // image: buildImage('Profit'),
              decoration: Decoration,
            ),
            PageViewModel(
                title: "Get Instant ",
                body:
                    "Get instant commission and high commission & convert your commission into cash for a fee. ",
                // image: buildImage('percentage'),
                decoration: Decoration),
            PageViewModel(
                title: "Faster Transaction",
                body:
                    " Best technologies have been used to make it as fast as possible to payment transactions. Faster transaction anywhere & anytime. ",
                // image: buildImage("transaction"),
                decoration: Decoration)
          ],
        )),
      ),
    );
  }
}
