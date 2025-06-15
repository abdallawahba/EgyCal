import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/models/food_details_model.dart';
import '../../../core/utils/constants.dart';

class NutrientBox extends StatelessWidget {
  const NutrientBox({super.key, required this.foodDetailsModel});
  final FoodDetailsModel foodDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          rowBuild('${foodDetailsModel.calories}', 'Calories'),
          SizedBox(
            width: 13.w
          ),
          rowBuild('${foodDetailsModel.proteins}%', 'Proteins'),
          SizedBox(
            width: 13.w,
          ),
          rowBuild('${foodDetailsModel.fats}%', 'Fats'),
          SizedBox(
            width: 13.w,
          ),
          rowBuild('${foodDetailsModel.carbs}%', 'Carbs'),
        ],
      ),
    );
  }
}
Widget rowBuild(String value,String label) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 80.w,
        height: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(37),
          color: kPrimaryColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 5.r),
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Center(
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                label,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}