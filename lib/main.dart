import 'package:flutter/material.dart';
import 'features/on_boarding/onboarding_screen.dart';
import 'features/splash/splash_screen.dart';

void main() {
  runApp(const EgyCal());
}

class EgyCal extends StatelessWidget {
  const EgyCal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => OnBoardingView(),
      },
    );
  }
}
