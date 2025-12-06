import 'package:flutter/material.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

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
                'Sales report and\nanalytics\nat your fingertips',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20, fontFamily:'Alice', fontStyle: FontStyle.italic),
              ),
              const Spacer(flex: 3),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/onboarding_image3.jpeg'),
              ),
              const Spacer(flex: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Get Started button
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        style: TextButton.styleFrom(backgroundColor: Colors.white),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(color: Color(0xFFFF4B3A), fontFamily:'Abel'),
                        ),
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
