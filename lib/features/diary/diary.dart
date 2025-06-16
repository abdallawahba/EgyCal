import 'package:egycal/core/models/current_users_data_model.dart';
import 'package:egycal/core/widgets/bottom_nav_bar.dart';
import 'package:egycal/features/diary/widgets/avatar.dart';
import 'package:egycal/features/diary/widgets/nutrients_indicator.dart';
import 'package:egycal/features/diary/widgets/water_intake_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});
  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            avatarImage(
              image: Provider.of<CurrentUserDataModel>(context,
                  listen: false)
                  .avatar,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              Provider.of<CurrentUserDataModel>(context, listen: false).firstName!,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nutrients Indicator',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.h),
            const NutrientsIndicator(),
            SizedBox(height: 20.h),
            Text('Water Intake',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.sp),
            WaterCard(),
            SizedBox(height: 20.sp),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text('Meals',
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold, fontSize: 16.sp)),
            //     MyWidget(meals: MealModel(name: 'Breakfast', calories: 0)),
            //     MyWidget(meals: MealModel(name: 'Snack', calories: 0)),
            //     MyWidget(meals: MealModel(name: 'Lunch', calories: 0)),
            //     MyWidget(meals: MealModel(name: 'Snack', calories: 0)),
            //     MyWidget(meals: MealModel(name: 'Dinner', calories: 0)),
            //   ],
            // ),

          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
