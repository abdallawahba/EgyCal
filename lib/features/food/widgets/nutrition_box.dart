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
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          rowbuild('${foodDetailsModel.calories}', 'Calories'),
          SizedBox(
            width: 13.w
          ),
          rowbuild('${foodDetailsModel.proteins}%', 'Proteins'),
          SizedBox(
            width: 13.w,
          ),
          rowbuild('${foodDetailsModel.fats}%', 'Fats'),
          SizedBox(
            width: 13.w,
          ),
          rowbuild('${foodDetailsModel.carbs}%', 'Carbs'),
        ],
      ),
    );
  }
}

Widget rowbuild(String value,String label) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 75,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(37),
          color: kPrimaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                // color: Colors.white,
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Center(
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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