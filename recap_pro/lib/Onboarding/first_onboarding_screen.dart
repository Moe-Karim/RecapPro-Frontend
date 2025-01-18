import 'package:flutter/material.dart';
import 'package:recap_pro/utils/design.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

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
                "./assets/Onboarding1.png", // Corrected image path
                fit: BoxFit
                    .cover, // Optional: Adjusts how the image fits within the constraints
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            const Text(
              "GAP FILLING",
              style: (title),
            ),
            const SizedBox(
              height: 25.0,
            ),
            const SizedBox(
              width: 350.0,
              child: Text(
                "Seamlessly restore missing moments with AI-driven gap filling for uninterrupted video clarity",
                style: 
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
