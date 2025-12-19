import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox.expand(
            child: Image.asset(
              'assets/images/onboarding_background.png', // your background image
              fit: BoxFit.cover,
            ),
          ),
          // Content over image
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              const Text(
                'Take orders easier\nand\nserve foods faster',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Alice', fontStyle: FontStyle.italic),
              ),
              const Spacer(flex: 3),
              // Center image
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/onboarding_image1.png'), // center image
              ),
              const Spacer(flex: 4),
              // Buttons at bottom
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Skip button
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.black87, fontFamily:'Abel'),
                      ),
                    ),
                    // Next button
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/onboarding2');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Color(0xFFFF4B3A), fontFamily:'Abel' ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
