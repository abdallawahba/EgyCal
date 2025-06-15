import 'package:egycal/core/models/food_details_model.dart';
import 'package:egycal/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodCard extends StatelessWidget {
  final FoodDetailsModel food;
  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.r),
      child: Container(
        height: 75.h,
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.87),
          borderRadius: BorderRadius.circular(18.r),
        ),
        padding: EdgeInsets.only(top:10.r,bottom: 10.r, left: 20.r, right: 12.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  food.engName!.length > 18
                      ? '${food.engName!.substring(0, 18)}...'
                      : food.engName!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Text('${food.calories?.toStringAsFixed(1) ?? '--'} kcal',
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),
            IconButton(
               icon: Icon(
                 Icons.add_circle_outline,
                 color: Colors.white,
               ),
               onPressed: () {
               },
             ),
          ],
        ),
      ),
    );
  }
}
