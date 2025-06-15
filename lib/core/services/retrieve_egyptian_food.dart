import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egycal/core/models/food_details_model.dart';

Future<List<FoodDetailsModel>> searchEgyptianFood(String searchExpression) async {
  final firestore = FirebaseFirestore.instance;
  final collection = firestore.collection('foods');
  final snapshot = await collection.get();
  final allFoods = snapshot.docs
      .map((doc) => FoodDetailsModel.fromJson(doc.data()))
      .toList();

  final results = allFoods.where((food) {
    final name = food.engName?.toLowerCase() ?? '';
    return name.contains(searchExpression.toLowerCase());
  }).toList();
  return results;
}
