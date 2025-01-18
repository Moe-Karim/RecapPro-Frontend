import 'package:flutter/material.dart';
import 'package:recap_pro/utils/design.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
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
            const SizedBox(
              height: 25.0,
            ),
            const Text(
              "VIDEO SEGMENTATION",
              style: (title)
            ),
            const SizedBox(
              height: 25.0,
            ),
            const SizedBox(
              width: 350.0,
              child: Text(
                "Automatically organize recordings into clear, topic-based sections with smart video segmentation.",
                style: (bodyText),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
