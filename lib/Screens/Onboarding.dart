import 'package:flutter/material.dart';
import 'package:keyboard/Screens/Onboarding1.dart';
import 'package:keyboard/Screens/Onboarding2.dart';
import 'package:keyboard/Screens/Onboarding3.dart';
import 'package:keyboard/Screens/Onboarding4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Onboarding1(),
              Onboarding2(),
              Onboarding3(),
              Onboarding4(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.white,
                    activeDotColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
