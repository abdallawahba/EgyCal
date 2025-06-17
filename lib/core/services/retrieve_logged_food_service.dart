import 'package:egycal/core/models/food_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Stream<List<FoodDetailsModel>> retrieveLoggedFood() {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return Stream.value([]);
  }
  final String date = DateTime.now().toIso8601String().split('T').first;

  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('loggedFood')
      .where('date', isEqualTo: date)
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      return FoodDetailsModel.fromJson(doc.data());
    }).toList();
  });
}

Future<List<FoodDetailsModel>> getLoggedFoodOnce() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return [];
  }
  final String date = DateTime.now().toIso8601String().split('T').first;

  final snapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('loggedFood')
      .where('date', isEqualTo: date)
      .get();

  return snapshot.docs.map((doc) {
    return FoodDetailsModel.fromJson(doc.data());
  }).toList();
}