import 'package:egycal/features/food/widgets/food_info.dart';
import 'package:egycal/features/food/widgets/nutrition_box.dart';
import 'package:egycal/features/food/widgets/nutrition_table.dart';
import 'package:flutter/material.dart';
import '../../core/models/food_details_model.dart';

class FoodDetailsPage extends StatefulWidget {
   final FoodDetailsModel selectedFood;
   const FoodDetailsPage({
     super.key,
     required this.selectedFood,
   });
  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          FoodInfo(food: widget.selectedFood),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NutrientBox(foodDetailsModel: widget.selectedFood),
            ],
          ),
          Divider(thickness: 1, color: Colors.grey, indent: 12, endIndent: 12),
          Expanded(
            child: ListView(
              children: [
                NutritionTable(foodModel: widget.selectedFood),
                Divider(thickness: 1, color: Colors.grey, indent: 12, endIndent: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

