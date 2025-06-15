import 'package:egycal/features/diary/models/nutrient_row_model.dart';
import 'package:egycal/features/diary/widgets/nutrient_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/models/current_users_data_model.dart';

class NutrientsIndicator extends StatelessWidget {
  const NutrientsIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: Colors.white,
      color: Colors.grey[50],
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: NutrientRow(
                    nutrientRowModel: NutrientRowModel(
                        label: 'Proteins (g)',
                        value: 0,
                        goal: Provider.of<CurrentUserDataModel>(context).goalProteinGrams!.toInt(),
                        color: Colors.red),
                  ),
                ),
                SizedBox(width: 12.r),
                Expanded(
                  //
                  child: NutrientRow(
                    nutrientRowModel: NutrientRowModel(
                        label: 'Fats (g)',
                        value: 0,
                        goal: Provider.of<CurrentUserDataModel>(context).goalFatsGrams!.toInt(),
                        color: Colors.orange),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: NutrientRow(
                    nutrientRowModel: NutrientRowModel(
                        label: 'Carbs (g)',
                        value: 0,
                        goal: Provider.of<CurrentUserDataModel>(context).goalCarbsGrams!.toInt(),
                        color: Colors.greenAccent),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            NutrientRow(
              nutrientRowModel: NutrientRowModel(
                  label: 'Calories',
                  value: 0,
                  goal: Provider.of<CurrentUserDataModel>(context).baseGoal!,
                  color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
