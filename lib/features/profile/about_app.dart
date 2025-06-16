import 'package:egycal/core/widgets/custom_text.dart';
import 'package:egycal/features/profile/widgets/bullet_point.dart';
import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text('About App'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pushReplacementNamed(context, '/profile'),
        ),
      ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomText(title: 'EgyCal - an Android app developed and designed to assist you on your journey to track your calories.', description: ''),
                ),
                Text('We provide with all the necessary ',
                style:TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                ) ,),
                Text(' features such as: ',
                style:TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                ) ,),
                SizedBox(height: 15,),
                BulletPoint(text: 'Diary to log your meals and water intake'),
                SizedBox(height: 10),
                BulletPoint(text: 'Reports to keep a track on your weight'),
                SizedBox(height: 10),
                BulletPoint(text: 'Recipes to quickly come up with something to cook')
              ],
            ),
          ),
    );
  }
}