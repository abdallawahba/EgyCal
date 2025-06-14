import 'package:egycal/core/models/food_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NutritionTable extends StatelessWidget {
  final FoodDetailsModel foodModel;
  const NutritionTable({super.key, required this.foodModel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.r, right: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nutrition Facts',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Serving Size',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Text(foodModel.servingSize ?? '' ,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
            ],
          ),
          Divider(),
          SizedBox(height: 10.h),
          buildNutritionRow('Total Fat', '${foodModel.totalFat}g'),
          _buildNutritionRow(
              '  Saturated Fat', '${foodModel.saturatedFat}g'),
          _buildNutritionRow('  Trans Fat', '${foodModel.transFat}g'),
          _buildNutritionRow(
              '  Polyunsaturated Fat', '${foodModel.polyunsaturatedFat}g'),
          _buildNutritionRow(
              '  Monounsaturated Fat', '${foodModel.monounsaturatedFat}g'),
          Divider(),
          buildNutritionRow('Cholesterol', '${foodModel.cholesterol}mg'),
          Divider(),
          buildNutritionRow('Sodium', '${foodModel.sodium}mg'),
          Divider(),
          buildNutritionRow(
              'Total Carbohydrate', '${foodModel.totalCarbohydrate}g'),
          _buildNutritionRow(
              '  Dietary Fiber', '${foodModel.dietaryFiber}g'),
          _buildNutritionRow('  Sugars', '${foodModel.sugars}g'),
          Divider(),
          buildNutritionRow('Protein', '${foodModel.proteins}g'),
          _buildNutritionRow('Calcium', '${foodModel.calcium}mg'),
          _buildNutritionRow('Vitamin D', '${foodModel.vitaminD}mg'),
          _buildNutritionRow('Iron', '${foodModel.iron}mg'),
          _buildNutritionRow('Potassium', '${foodModel.potassium}mg'),
          _buildNutritionRow('Vitamin A', '${foodModel.vitaminA}mcg'),
          _buildNutritionRow('Vitamin C', '${foodModel.vitaminC}mg'),
        ],
      ),
    );
  }

  Widget _buildNutritionRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16.sp),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }

  Widget buildNutritionRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
