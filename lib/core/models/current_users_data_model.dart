import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CurrentUserDataModel {
  bool? usingGoogle;
  String? email;
  String? firstName;
  String? lastName;
  int? day;
  int? month;
  int? year;
  String? goal;
  String? gender;
  String? activity;
  double? height;
  double? weight;
  String? avatar;
  int? baseGoal;
  double? progressPercent;
  int? remaining;
  int? foodCalories;
  int? age;
  String? greeting;
  double? goalProteinGrams;
  double? goalCarbsGrams;
  double? goalFatsGrams;
  double? goalWaterL;

  CurrentUserDataModel(){
    email = '';
    firstName = '';
    lastName = '';
    day = 0;
    month = 0;
    year = 0;
    goal = '';
    gender = '';
    activity = '';
    height = 0;
    weight = 0;
    avatar = '';
    usingGoogle = false;
    baseGoal = 0;
    progressPercent = 0;
    remaining = 0;
    foodCalories = 0;
    age = 0;
    greeting = '';
    goalProteinGrams = 0;
    goalCarbsGrams = 0;
    goalFatsGrams = 0;
    goalWaterL = 0;
    fetch();
  }

  void calculateAge() {
    final now = DateTime.now();
    age = now.year - year!;
    if (now.month < month! || (now.month == month && now.day < day!)) {
      age = age! - 1;
    }
  }

  void getGreeting() {
    final currentTime = DateTime.now().toUtc().add(const Duration(hours: 3));
    final hour = currentTime.hour;
    if (hour >= 5 && hour < 12) {
      greeting = 'Good morning';
    } else if (hour >= 12 && hour < 17) {
      greeting = 'Good afternoon';
    } else {
      greeting = 'Good evening';
    }
  }

  Future<void> fetch() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final docSnapshot = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
      if (!docSnapshot.exists) {
        CurrentUserDataModel();
      }
      final data = docSnapshot.data()!;
      email = data['email'];
      firstName = data['firstName'];
      lastName = data['lastName'];
      day = data['day'];
      month = data['month'];
      year = data['year'];
      goal = data['goal'];
      gender = data['gender'];
      activity = data['activity'];
      height = data['height'];
      weight = data['weight'];
      avatar = data['avatar'];
      calculateAge();
      getGreeting();
      double? bmr;
      double? activityMultiplier;
      double? calorieAdjustment;
      double waterMultiplier;
      if (gender == "Male") {
        bmr = 10 * weight! + 6.25 * height! - 5 * age! + 5;
      } else if (gender == "Female") {
        bmr = 10 * weight! + 6.25 * height! - 5 * age! - 161;
      }

      switch (activity) {
        case 'Sedentary':
          activityMultiplier = 1.2;
          waterMultiplier = 35;
          break;
        case 'Low Active':
          activityMultiplier = 1.375;
          waterMultiplier = 37;
          break;
        case 'Active':
          activityMultiplier = 1.55;
          waterMultiplier = 40;
          break;
        case 'Very Active':
          activityMultiplier = 1.725;
          waterMultiplier = 45;
          break;
        default:
          activityMultiplier = 1.2;
          waterMultiplier = 35;
      }

      double maintenanceCalories = bmr! * activityMultiplier;

      switch (goal) {
        case 'Lose Weight':
          calorieAdjustment = -500;
          break;
        case 'Keep Weight':
          calorieAdjustment = 0;
          break;
        case 'Gain Weight':
          calorieAdjustment = 500;
          break;
        default:
          calorieAdjustment = 0;
      }

      baseGoal = (maintenanceCalories + calorieAdjustment).toInt();
      foodCalories = 0;
      progressPercent = double.parse((foodCalories! / baseGoal!).toStringAsFixed(4));
      remaining = baseGoal! - foodCalories!;
      double proteinPerKg;
      switch (goal) {
        case 'Lose Weight':
          proteinPerKg = 2.0;
          break;
        case 'Gain Weight':
          proteinPerKg = 2.2;
          break;
        default:
          proteinPerKg = 1.8;
      }
      goalProteinGrams = double.parse((proteinPerKg * weight!).toStringAsFixed(1));
      double fatPercentage = (goal == 'Lose Weight') ? 0.25 : 0.3;
      goalFatsGrams = double.parse(((baseGoal! * fatPercentage) / 9).toStringAsFixed(1));
      double proteinCalories = goalProteinGrams! * 4;
      double fatCalories = goalFatsGrams! * 9;
      double carbCalories = baseGoal! - proteinCalories - fatCalories;
      goalCarbsGrams = double.parse((carbCalories / 4).toStringAsFixed(1));
      goalWaterL = double.parse((weight! * waterMultiplier).toStringAsFixed(0))/1000;
    } catch (e) {
      CurrentUserDataModel();
    }
  }

  Map<String, dynamic> toMap(){
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'day': day,
      'month': month,
      'year': year,
      'goal': goal,
      'gender': gender,
      'activity': activity,
      'height': height,
      'weight': weight,
      'avatar': avatar,
      'usingGoogle': usingGoogle,
      'baseGoal': baseGoal,
      'progressPercent': progressPercent,
      'remaining': remaining,
      'foodCalories': foodCalories,
      'age': age,
      'greeting': greeting,
      'goalProteinGrams': goalProteinGrams,
      'goalCarbsGrams': goalCarbsGrams,
      'goalFatsGrams': goalFatsGrams,
      'goalWaterL': goalWaterL,
    };
  }

  void clean(){
    email = null;
    firstName = null;
    lastName = null;
    day = null;
    month = null;
    year = null;
    goal = null;
    gender = null;
    activity = null;
    height = null;
    weight = null;
    avatar = null;
    usingGoogle = false;
    baseGoal = null;
    progressPercent = null;
    remaining = null;
    foodCalories = null;
    age = null;
    greeting = null;
    goalProteinGrams = null;
    goalCarbsGrams = null;
    goalFatsGrams = null;
    goalWaterL = null;
  }
}
