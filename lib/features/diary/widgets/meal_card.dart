import 'package:egycal/features/diary/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.meals});
  final MealModel meals;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[50],
      margin: EdgeInsets.only(
        bottom: 10.r,
      ),
      child: SizedBox(
        height: 100.h,
        child: Padding(
          padding: EdgeInsets.only(top: 8.r),
          child: ListTile(
            contentPadding: EdgeInsets.only(right: 16.r, left: 16.r, top: 10.r),
            title: Text(
              meals.name,
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
            trailing: Text(
              '${meals.calories} kcal',
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
