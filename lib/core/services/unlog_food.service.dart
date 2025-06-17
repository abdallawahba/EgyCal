import 'package:egycal/core/models/food_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:egycal/core/models/current_users_data_model.dart';

Future<void> unlogFood(FoodDetailsModel food, CurrentUserDataModel model) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    throw Exception('User not logged in');
  }
  final String date = DateTime.now().toIso8601String().split('T').first;
  final String? foodId = food.foodId;
  if (foodId == null) {
    throw Exception('foodId is null');
  }
  final String docId = '${foodId}_$date';
  final docRef = FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('loggedFood')
      .doc(docId);

  await docRef.delete();
  await model.fetch();
}