import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egycal/core/models/food_details_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> handleFavorites(FoodDetailsModel food) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    print("Error: User not logged in");
    return;
  }

  final String foodId = food.foodId;
  final docRef = FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('favorites')
      .doc(foodId);
  try {
    final doc = await docRef.get();
    if (doc.exists) {
      await docRef.delete();
      food.isFavorite = false;
    } else {
      await docRef.set(food.toJson());
      food.isFavorite = true;
    }
  } catch (e) {
    print("Error while toggling favorite: $e");
  }
}
