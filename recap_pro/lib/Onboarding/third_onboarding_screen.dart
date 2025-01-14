import 'package:flutter/material.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      body:   Center(
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
                      const Text(
            "VIDEO SEGMENTATION",
            style: TextStyle(
              fontSize: 24.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
                    const SizedBox(
            width: 350.0,
            child: Text(
              "Automatically organize recordings into clear, topic-based sections with smart video segmentation.",
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              textAlign: TextAlign.center,
            ),
          )
          ],
        ),
      ),
    );
  }
}