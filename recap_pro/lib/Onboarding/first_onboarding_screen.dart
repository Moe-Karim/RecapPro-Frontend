import 'package:flutter/material.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:           Container(
            width: double.infinity, // Full width of the screen
            constraints: const BoxConstraints(
              maxHeight: 500.0, // Set a maximum height
            ),
            child: Image.asset(
              "assets/Onboarding1.png", // Corrected image path
              fit: BoxFit
                  .cover, // Optional: Adjusts how the image fits within the constraints
            ),
          ),
    );
  }
}