import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/food_details_model.dart';

Future<List<FoodDetailsModel>> fetchAddedFoodsFromFirebase(String userId) async {
  final addedFoodsSnapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('addedFoods')
      .get();

  if (addedFoodsSnapshot.docs.isEmpty) {
    return [];
  }

  return addedFoodsSnapshot.docs.map((doc) {
    final data = doc.data();
    return FoodDetailsModel(
      foodId: data['foodId'],
      engName: data['engName'],
      calories: (data['calories'] as num?)?.toDouble(),
      proteins: (data['proteins'] as num?)?.toDouble(),
      fats: (data['fats'] as num?)?.toDouble(),
      carbs: (data['carbs'] as num?)?.toDouble(),
      servingSize: data['servingSize'],
      totalFat: (data['totalFat'] as num?)?.toDouble(),
      saturatedFat: (data['saturatedFat'] as num?)?.toDouble(),
      transFat: (data['transFat'] as num?)?.toDouble(),
      polyunsaturatedFat: (data['polyunsaturatedFat'] as num?)?.toDouble(),
      monounsaturatedFat: (data['monounsaturatedFat'] as num?)?.toDouble(),
      cholesterol: (data['cholesterol'] as num?)?.toDouble(),
      sodium: (data['sodium'] as num?)?.toDouble(),
      totalCarbohydrate: (data['totalCarbohydrate'] as num?)?.toDouble(),
      dietaryFiber: (data['dietaryFiber'] as num?)?.toDouble(),
      sugars: (data['sugars'] as num?)?.toDouble(),
      totalProtein: (data['totalProtein'] as num?)?.toDouble(),
      calcium: (data['calcium'] as num?)?.toDouble(),
      iron: (data['iron'] as num?)?.toDouble(),
      potassium: (data['potassium'] as num?)?.toDouble(),
      vitaminA: (data['vitaminA'] as num?)?.toDouble(),
      vitaminC: (data['vitaminC'] as num?)?.toDouble(),
      vitaminD: (data['vitaminD'] as num?)?.toDouble(),
      isFavorite: data['isFavorite'] ?? false,
    );
  }).toList();
}
