import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/on_boarding/onboarding_screen.dart';
import 'features/users_data/name_and_birth_date.dart';
import 'features/sign_up_with_email/sign_up_with_email.dart';
import 'features/splash/splash_screen.dart';
import 'features/welcome/welcome_screen.dart';

void main() {
  runApp(const EgyCal());
}

class EgyCal extends StatelessWidget {
  const EgyCal({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/onboarding': (context) => const OnBoardingView(),
            '/welcome': (context) => const Welcome(),
            '/signUpWithEmail': (context) => const SignUpWithEmail(),
            '/NameAndBirthDate': (context) => const NameAndBirthDate(),
          },
        );
      },
    );
  }
}
