import 'package:intl/intl.dart';

class MealModel {
  final String name;
  final formattedTime = DateFormat.jm().format(DateTime.now());
  final int calories;
  MealModel({required this.name, required this.calories});
}
