import 'package:flutter/material.dart';
import 'package:recap_pro/Onboarding/first_onboarding_screen.dart';
import 'package:recap_pro/Onboarding/second_onboarding_screen.dart';
import 'package:recap_pro/Onboarding/third_onboarding_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
            ],
          ),
          Container(
              alignment: Alignment(0, 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOutCirc);
                      },
                      child: Text('next')),
                  SmoothPageIndicator(controller: _controller, count: 3),
                  TextButton(
                      onPressed: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOutCirc);
                      },
                      child: Text('skip')),
                ],
              )),
        ],
      ),
    );
  }
}
