import 'package:egycal/features/add_food/add_food_page.dart';
import 'package:flutter/material.dart';
import '../../features/diary/diary.dart';
import '../../features/favorites/favorites.dart';
import '../../features/home/home_screen.dart';
import '../../features/food/food_details.dart';
import '../../features/food/log_food.dart';
import '../../features/profile/profile.dart';
import '../../features/reports/reports.dart';
import '../models/food_details_model.dart';
import '/features/on_boarding/on_boarding_screen.dart';
import '/features/authorization_with_email/log_in_with_email.dart';
import '/features/authorization_with_email/reset_password_screen.dart';
import '/features/users_data/activity.dart';
import '/features/users_data/avatar.dart';
import '/features/users_data/gender.dart';
import '/features/users_data/goal.dart';
import '/features/users_data/name_and_birth_date.dart';
import '/features/authorization_with_email/sign_up_with_email.dart';
import '/features/splash/splash_screen.dart';
import '/features/users_data/weight.dart';
import '/features/users_data/height.dart';
import '/features/welcome/welcome_screen.dart';
import 'auth_wrapper.dart';



Color kPrimaryColor = Color(0xFF152D2F);
Color kSecondaryColor = Color(0xFF337277);
Color kSubTitlesColor = Color(0xFF6E7179);
Color kTitlesColor = Color(0xFF0D1220);
String kInterFont = 'Inter';
String kRobotoFont = 'Roboto';
String kCarroisGothicFont = 'Carrois Gothic';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
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
  '/home': (context) => const HomeScreen(),
  '/addFood': (context) => const AddFoodPage(),
  '/favorites': (context) => const FavoritesPage(),
  '/diary': (context) => const DiaryPage(),
  '/reports': (context) => const ReportsPage(),
  '/logFood': (context) => const LogFoodPage(),
  '/profile': (context) => const ProfilePage(),
  '/authWrapper': (context) => AuthWrapper(),
  '/foodDetails': (context) {
    final food = ModalRoute.of(context)!.settings.arguments as FoodDetailsModel;
    return FoodDetailsPage(selectedFood: food);
  },
};

