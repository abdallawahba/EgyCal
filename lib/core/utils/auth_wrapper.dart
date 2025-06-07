import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../features/home/home_screen.dart';
import '../../features/welcome/welcome_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading state (Firebase checking)
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          // User is signed in - navigate to Home or Onboarding as you want
          // If you want onboarding check, add it here or navigate directly
          return HomeScreen(); // or OnboardingPage()
        } else {
          // User NOT signed in, go to SignInPage
          return Welcome();
        }
      },
    );
  }
}