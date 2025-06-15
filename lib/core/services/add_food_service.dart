import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:egycal/core/models/food_details_model.dart';

Future<bool> addFood(FoodDetailsModel food) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    throw Exception('No user logged in');
  }

  final userId = user.uid;
  final String customFoodId =
      '$userId-${food.engName!.trim().toLowerCase().replaceAll(' ', '')}-${food.calories?.toStringAsFixed(1)}-${food.proteins?.toStringAsFixed(1)}-${food.carbs?.toStringAsFixed(1)}-${food.fats?.toStringAsFixed(1)}';
  food.assignId(customFoodId);
  final docRef = FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('addedFoods')
      .doc(customFoodId);

  final docSnapshot = await docRef.get();

  if (docSnapshot.exists) {
    return false;
  }

  final foodMap = {
    'foodId': food.foodId,
    'engName': food.engName,
    'calories': food.calories,
    'proteins': food.proteins,
    'fats': food.fats,
    'carbs': food.carbs,
    'servingSize': food.servingSize,
    'totalFat': food.totalFat,
    'saturatedFat': food.saturatedFat,
    'transFat': food.transFat,
    'polyunsaturatedFat': food.polyunsaturatedFat,
    'monounsaturatedFat': food.monounsaturatedFat,
    'cholesterol': food.cholesterol,
    'sodium': food.sodium,
    'totalCarbohydrate': food.totalCarbohydrate,
    'dietaryFiber': food.dietaryFiber,
    'sugars': food.sugars,
    'totalProtein': food.totalProtein,
    'calcium': food.calcium,
    'iron': food.iron,
    'potassium': food.potassium,
    'vitaminA': food.vitaminA,
    'vitaminC': food.vitaminC,
    'vitaminD': food.vitaminD,
    'isFavorite': food.isFavorite,
  };
  await docRef.set(foodMap);
  return true;
}
