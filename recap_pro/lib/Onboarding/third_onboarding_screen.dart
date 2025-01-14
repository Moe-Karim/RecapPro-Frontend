import 'package:flutter/material.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Full width of the screen
        constraints: const BoxConstraints(
          maxHeight: 500.0, // Set a maximum height
        ),
        child: Image.asset(
          "./assets/Onboarding3.png", // Corrected image path
          fit: BoxFit
              .cover, // Optional: Adjusts how the image fits within the constraints
        ),
      ),
    );
  }
}