import 'package:egycal/features/diary/models/nutrient_row_model.dart';
import 'package:flutter/material.dart';


class NutrientRow extends StatelessWidget {
  const NutrientRow({super.key, required this.nutrientRowModel});
  
  final NutrientRowModel nutrientRowModel;
  @override
  Widget build(BuildContext context) {
    double percent = nutrientRowModel.value / nutrientRowModel.goal;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "${nutrientRowModel.value} / ${nutrientRowModel.goal}",
        ),
        LinearProgressIndicator(
            borderRadius: BorderRadius.circular(8),
            minHeight: 5,
            value: percent,
            color: nutrientRowModel.color,
            backgroundColor: Colors.grey.shade300),
        const SizedBox(height: 4),
        Text(
          nutrientRowModel.label,
        ),
      ],
    );
  }
}
