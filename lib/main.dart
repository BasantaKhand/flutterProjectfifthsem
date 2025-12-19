// import 'package:flutter/material.dart';
// import 'screens/splash_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const SplashScreen(),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding/onboarding_screen1.dart';
import 'screens/onboarding/onboarding_screen2.dart';
import 'screens/onboarding/onboarding_screen3.dart';
import 'screens/authorization/login_screen.dart'; // placeholder login screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding1': (context) => const OnboardingScreen1(),
        '/onboarding2': (context) => const OnboardingScreen2(),
        '/onboarding3': (context) => const OnboardingScreen3(),
        '/login': (context) => const LoginPage(), // placeholder
      },
    );
  }
}
