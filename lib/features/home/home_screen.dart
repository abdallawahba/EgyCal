import 'package:egycal/core/models/current_users_data_model.dart';
import 'package:egycal/core/widgets/bottom_nav_bar.dart';
import 'package:egycal/features/home/widgets/calorie_intake.dart';
import 'package:egycal/features/home/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 0) {
          Provider.of<CurrentUserDataModel>(context,listen: false).fetch();
          Navigator.pushReplacementNamed(context, '/home');
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [CalorieIntake(), gridViewCards(context)],
        ),
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }

  Flexible gridViewCards(BuildContext context) {
    return Flexible(
        child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(20.r),
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1,
            children: [
              Cards(
                icon: Icons.fastfood,
                label: 'Log Food',
                onTap: () {
                  Navigator.pushNamed(context, '/logFood');
                },
              ),
              Cards(
                icon: Icons.bar_chart,
                label: 'Reports',
                onTap: () {
                  Navigator.pushNamed(context, '/reports');
                },
              ),
              Cards(
                icon: Icons.add_circle_outline,
                label: 'Add Food',
                onTap: () {
                  Navigator.pushNamed(context, '/addFood');
                },
              ),
              Cards(
                icon: Icons.pie_chart_outline,
                label: 'Diary',
                onTap: () {
                  Navigator.pushNamed(context, '/diary');
                },
              ),
            ]));
  }
}
