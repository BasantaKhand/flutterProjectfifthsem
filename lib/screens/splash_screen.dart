import 'dart:async';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // 2-second logic placeholder — add navigation here when ready
//     Timer(const Duration(seconds: 2), () {
//       // Example: Navigator.pushReplacementNamed(context, '/onboarding');
//       // Currently empty by design.
//     });
//   }


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/onboarding1');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // whitesmoke
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Circular logo (282 x 282)
            Container(
              width: 282,
              height: 282,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/logos/dinesmart_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Borderless rectangular container for future icon
            Container(
              width: 200,
              height: 48,
              alignment: Alignment.center,
              // no border, plain container (white on slightly off-white background)
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
             child: Image.asset(
                'assets/icons/loading.png',
                width: 28,
                height: 28,
                fit: BoxFit.contain,
              ),

            ),
          ],
        ),
      ),
    );
  }
}
