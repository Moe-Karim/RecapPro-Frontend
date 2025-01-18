import 'package:flutter/material.dart';
import 'package:recap_pro/Onboarding/first_onboarding_screen.dart';
import 'package:recap_pro/Onboarding/second_onboarding_screen.dart';
import 'package:recap_pro/Onboarding/third_onboarding_screen.dart';
import 'package:recap_pro/login/login_page.dart';
import 'package:recap_pro/utils/design.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = (index == 2);
              });
            },
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
                  if (!isLastPage)
                    TextButton(
                        onPressed: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOutCirc);
                        },
                        child: const Text('Next', style: (buttonTextStyle))),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: indicatorEffect,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginPage();
                        }));
                      },
                      child: const Text('Skip', style: (buttonTextStyle))),
                ],
              )),
        ],
      ),
    );
  }
}
