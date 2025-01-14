import 'package:flutter/material.dart';
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
              Container(
                color: Colors.black,
              ),
              Container(
                color: Colors.white,
              ),
              Container(
                color: Colors.purple,
              ),
            ],
          ),
          SmoothPageIndicator(controller: _controller, count: 3),
        ],
      ),
    );
  }
}
