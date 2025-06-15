import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/food_details_model.dart';

Future<List<FoodDetailsModel>> fetchFavoriteFoodsFromFirebase(String userId) async {
  final clientId = '273df33156734ae4a60a3efbcbb9edde';
  final clientSecret = 'c9258b2d8e1c48629c2ae7c97da57985';
  final authString = '$clientId:$clientSecret';
  final authEncoded = base64Encode(utf8.encode(authString));
  final baseUri = 'https://platform.fatsecret.com/rest/server.api?method=';
  final favoritesSnapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('favorites')
      .get();
  List<String> foodIds =
      favoritesSnapshot.docs.map((doc) => doc.id).toList();

  if (foodIds.isEmpty) return [];

  final tokenResponse = await http.post(
    Uri.parse('https://oauth.fatsecret.com/connect/token'),
    headers: {
      'Authorization': 'Basic $authEncoded',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {'grant_type': 'client_credentials'},
  );

  if (tokenResponse.statusCode != 200) {
    debugPrint('❌ Failed to get access token');
    return [];
  }

  final accessToken = jsonDecode(tokenResponse.body)['access_token'];
  final authHeaders = {'Authorization': 'Bearer $accessToken'};

  List<FoodDetailsModel> data = [];
  for (final foodId in foodIds) {
    final foodResponse = await http.get(
      Uri.parse('${baseUri}food.get.v4&food_id=$foodId&format=json'),
      headers: authHeaders,
    );
    if (foodResponse.statusCode != 200) continue;
    final foodData = jsonDecode(foodResponse.body)['food'];
    final servings = foodData['servings']['serving'];
    final servingList = servings is List ? servings : [servings];
    final servingData = servingList.firstWhere(
          (s) => s['serving_description'] == '100 g',
      orElse: () => servingList.first,
    );
    final proteinG = double.tryParse(servingData['protein'] ?? '0') ?? 0;
    final fatG = double.tryParse(servingData['fat'] ?? '0') ?? 0;
    final carbG = double.tryParse(servingData['carbohydrate'] ?? '0') ?? 0;
    final proteinKcal = proteinG * 4;
    final fatKcal = fatG * 9;
    final carbKcal = carbG * 4;
    final totalMacroKcal = proteinKcal + fatKcal + carbKcal;
    double proteinPct = 0, fatPct = 0, carbPct = 0;
    if (totalMacroKcal > 0) {
      proteinPct = (proteinKcal / totalMacroKcal) * 100;
      fatPct = (fatKcal / totalMacroKcal) * 100;
      carbPct = (carbKcal / totalMacroKcal) * 100;
    }
    data.add(FoodDetailsModel(
      engName: foodData['food_name'] ?? 'Unknown',
      foodId: foodId,
      calories: double.tryParse(servingData['calories'] ?? '0'),
      proteins: double.tryParse(proteinPct.toStringAsFixed(1)),
      fats: double.tryParse(fatPct.toStringAsFixed(1)),
      carbs: double.tryParse(carbPct.toStringAsFixed(1)),
      servingSize: servingData['serving_description'] ?? '-',
      totalFat: double.tryParse(servingData['total_fat'] ?? servingData['fat'] ?? '0'),
      saturatedFat: double.tryParse(servingData['saturated_fat'] ?? '0'),
      transFat: double.tryParse(servingData['trans_fat'] ?? '0'),
      polyunsaturatedFat: double.tryParse(servingData['polyunsaturated_fat'] ?? '0'),
      monounsaturatedFat: double.tryParse(servingData['monounsaturated_fat'] ?? '0'),
      cholesterol: double.tryParse(servingData['cholesterol'] ?? '0'),
      sodium: double.tryParse(servingData['sodium'] ?? '0'),
      totalCarbohydrate: double.tryParse(servingData['total_carbohydrate'] ?? servingData['carbohydrate'] ?? '0'),
      dietaryFiber: double.tryParse(servingData['dietary_fiber'] ?? '0'),
      sugars: double.tryParse(servingData['sugar'] ?? '0'),
      totalProtein: double.tryParse(servingData['total_protein'] ?? servingData['protein'] ?? '0'),
      calcium: double.tryParse(servingData['calcium'] ?? '0'),
      iron: double.tryParse(servingData['iron'] ?? '0'),
      potassium: double.tryParse(servingData['potassium'] ?? '0'),
      vitaminA: double.tryParse(servingData['vitamin_a'] ?? '0'),
      vitaminC: double.tryParse(servingData['vitamin_c'] ?? '0'),
      vitaminD: double.tryParse(servingData['vitamin_d'] ?? '0'),
      isFavorite: true,
    ));
  }
  return data;
}
