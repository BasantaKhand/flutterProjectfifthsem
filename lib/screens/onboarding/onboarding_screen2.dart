import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/onboarding_background.png', fit: BoxFit.cover),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              const Text(
                'process orders swiftly\nand\ngenerate bills with ease',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20, fontFamily:'Alice', fontStyle: FontStyle.italic),
              ),
              const Spacer(flex: 3),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/onboarding_image2.jpeg'),
              ),
              const Spacer(flex: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.white),
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.black87, fontFamily:'Abel'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/onboarding3');
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.white),
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Color(0xFFFF4B3A), fontFamily:'Abel'),
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
