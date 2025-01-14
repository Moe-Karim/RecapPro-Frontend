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
                  Text('next'),
                  SmoothPageIndicator(controller: _controller, count: 3),
                  Text('skip'),
                ],
              )),
        ],
      ),
    );
  }
}
