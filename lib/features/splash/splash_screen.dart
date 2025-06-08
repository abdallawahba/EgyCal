import 'package:egycal/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../../core/models/current_users_data_model.dart';
import '../../core/utils/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool seenOnBoarding =false;
  @override
  void initState() {
    super.initState();
    decideNextScreen();
    Provider.of<CurrentUserDataModel>(context, listen: false).fetch();
    Timer(
      Duration(seconds: 4),
          () {
            if (!seenOnBoarding){
                Navigator.pushReplacementNamed(context, '/onboarding',);
        }
            else{Navigator.pushReplacementNamed(context, '/authWrapper',);}
          }
    );
  }

  Future<void> decideNextScreen() async {
    seenOnBoarding = await hasSeenOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
          )
        ],
      ),
    );
  }
}