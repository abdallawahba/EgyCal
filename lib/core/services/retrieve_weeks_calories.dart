import 'package:cloud_firestore/cloud_firestore.dart';

class WeeklyCaloriesData {
  final Map<int, double> calories;
  final Map<int, String> labels;

  WeeklyCaloriesData({required this.calories, required this.labels});
}

Future<WeeklyCaloriesData> getWeeklyCalories(String userId) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<int, double> weeklyCalories = {};
  Map<int, String> weeklyLabels = {};

  for (int i = 6; i >= 0; i--) {
    DateTime date = DateTime.now().subtract(Duration(days: i));
    String formattedDate =
        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    int dayIndex = 6 - i;
    try {
      DocumentSnapshot documentSnapshot = await firestore
          .collection('users')
          .doc(userId)
          .collection('dailyCalories')
          .doc(formattedDate)
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        double totalCalories = (data['totalCalories'] as num).toDouble();
        weeklyCalories[dayIndex] = totalCalories;
      } else {
        weeklyCalories[dayIndex] = 0.0;
      }
      weeklyLabels[dayIndex] = date.day.toString();
    } catch (e) {
      print("Error fetching data for $formattedDate: $e");
      weeklyCalories[dayIndex] = 0.0;
      weeklyLabels[dayIndex] = date.day.toString();
    }
  }

  return WeeklyCaloriesData(calories: weeklyCalories, labels: weeklyLabels);
}
