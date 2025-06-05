import 'package:egycal/core/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/shared_preferences.dart';
import 'features/on_boarding/on_boarding_screen.dart';
import 'features/authorization_with_email/log_in_with_email.dart';
import 'features/authorization_with_email/reset_password_screen.dart';
import 'features/users_data/activity.dart';
import 'features/users_data/avatar.dart';
import 'features/users_data/gender.dart';
import 'features/users_data/goal.dart';
import 'features/users_data/name_and_birth_date.dart';
import 'features/authorization_with_email/sign_up_with_email.dart';
import 'features/splash/splash_screen.dart';
import 'features/users_data/weight.dart';
import 'features/users_data/height.dart';
import 'features/welcome/welcome_screen.dart';

void main(){
  runApp(const EgyCal());
}

class EgyCal extends StatelessWidget {
  const EgyCal({super.key});
  @override
  Widget build(BuildContext context) {
    UserDataModel usersInfoModel = UserDataModel();
    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Provider(
          create: (context) {
            return usersInfoModel;
          },
          child: MaterialApp(
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
              '/logInWithEmail': (context) => const LogInWithEmail(),
              '/resetPassword': (context) => const ResetPassword(),
              '/NameAndBirthDate': (context) => const NameAndBirthDate(),
              '/goal': (context) => const Goal(),
              '/gender': (context) => const Gender(),
              '/activity': (context) => const Activity(),
              '/weight': (context) => const Weight(),
              '/height': (context) => const Height(),
              '/avatar': (context) => const Avatar(),
            },
          ),
        );
      },
    );
  }
}
