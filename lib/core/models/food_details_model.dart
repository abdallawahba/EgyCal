class FoodDetailsModel {
  final String engName;
  final String foodId;
  final double? calories;
  final double? proteins;
  final double? fats;
  final double? carbs;
  final String? servingSize;
  final double? totalFat;
  final double? saturatedFat;
  final double? transFat;
  final double? polyunsaturatedFat;
  final double? monounsaturatedFat;
  final double? cholesterol;
  final double? sodium;
  final double? totalCarbohydrate;
  final double? dietaryFiber;
  final double? sugars;
  final double? totalProtein;
  final double? calcium;
  final double? iron;
  final double? potassium;
  final double? vitaminA;
  final double? vitaminC;
  final double? vitaminD;
  bool isFavorite;

  FoodDetailsModel({
    required this.engName,
    required this.foodId,
    this.calories,
    this.proteins,
    this.fats,
    this.carbs,
    this.servingSize,
    this.totalFat,
    this.saturatedFat,
    this.transFat,
    this.polyunsaturatedFat,
    this.monounsaturatedFat,
    this.cholesterol,
    this.sodium,
    this.totalCarbohydrate,
    this.dietaryFiber,
    this.sugars,
    this.totalProtein,
    this.calcium,
    this.iron,
    this.potassium,
    this.vitaminA,
    this.vitaminC,
    this.vitaminD,
    this.isFavorite = false,
  });

  factory FoodDetailsModel.fromJson(Map<String, dynamic> json) {
    return FoodDetailsModel(
      engName: json['engName'],
      foodId: json['food_id'],
      calories: json['calories'],
      proteins: json['proteins'],
      fats: json['fats'],
      carbs: json['carbs'],
      servingSize: json['servingSize'],
      totalFat: json['totalFat'],
      saturatedFat: json['saturatedFat'],
      transFat: json['transFat'],
      polyunsaturatedFat: json['polyunsaturatedFat'],
      monounsaturatedFat: json['monounsaturatedFat'],
      cholesterol: json['cholesterol'],
      sodium: json['sodium'],
      totalCarbohydrate: json['totalCarbohydrate'],
      dietaryFiber: json['dietaryFiber'],
      sugars: json['sugars'],
      totalProtein: json['totalProtein'],
      calcium: json['calcium'],
      iron: json['iron'],
      potassium: json['potassium'],
      vitaminA: json['vitaminA'],
      vitaminC: json['vitaminC'],
      vitaminD: json['vitaminD'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'engName': engName,
      'food_id': foodId,
      'calories': calories,
      'proteins': proteins,
      'fats': fats,
      'carbs': carbs,
      'servingSize': servingSize,
      'totalFat': totalFat,
      'saturatedFat': saturatedFat,
      'transFat': transFat,
      'polyunsaturatedFat': polyunsaturatedFat,
      'monounsaturatedFat': monounsaturatedFat,
      'cholesterol': cholesterol,
      'sodium': sodium,
      'totalCarbohydrate': totalCarbohydrate,
      'dietaryFiber': dietaryFiber,
      'sugars': sugars,
      'totalProtein': totalProtein,
      'calcium': calcium,
      'iron': iron,
      'potassium': potassium,
      'vitaminA': vitaminA,
      'vitaminC': vitaminC,
      'vitaminD': vitaminD,
      'isFavorite': isFavorite,
    };
  }
}
