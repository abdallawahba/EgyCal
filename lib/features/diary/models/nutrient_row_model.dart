import 'dart:ui';

class NutrientRowModel {
  final String label;
  final int value;
  final int goal;
  final Color color;
  NutrientRowModel(
      {required this.label,
      required this.value,
      required this.goal,
      required this.color});
}
