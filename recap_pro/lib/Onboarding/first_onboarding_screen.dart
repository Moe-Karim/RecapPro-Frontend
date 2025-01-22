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
              width: double.infinity, 
              constraints: const BoxConstraints(
                maxHeight: 500.0, 
              ),
              child: Image.asset(
                "./assets/Onboarding1.png", 
                fit: BoxFit
                    .cover, 
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
