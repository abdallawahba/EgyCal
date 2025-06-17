import 'package:egycal/core/models/current_users_data_model.dart';
import 'package:egycal/core/models/food_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';


Future<void> logFood(FoodDetailsModel food, double quantity, CurrentUserDataModel model) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    throw Exception('User not logged in');
  }
  final String date = DateTime.now().toIso8601String().split('T').first;
  final String? foodId = food.foodId;
  if (foodId == null) throw Exception('foodId is null');
  final String docId = '${foodId}_$date';
  final docRef = FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('loggedFood')
      .doc(docId);
  final docSnapshot = await docRef.get();
  double existingQuantity = 0;
  if (docSnapshot.exists) {
    final data = docSnapshot.data();
    existingQuantity = double.tryParse(data?['quantity']?.toString() ?? '0') ?? 0;
  }
  final double newQuantity = existingQuantity + quantity;
  food.assignQuantity(newQuantity);
  final Map<String, dynamic> logData = {
    ...food.toJson(),
    'date': date,
    'timestamp': FieldValue.serverTimestamp(),
  };
  await docRef.set(logData, SetOptions(merge: true));
  await model.fetch();
}
