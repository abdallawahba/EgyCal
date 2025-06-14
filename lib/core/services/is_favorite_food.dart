import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> isFoodFavorite(String foodId) async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('favorites')
        .doc(foodId)
        .get();
    return doc.exists;
  } catch (e) {
    return false;
  }
}
