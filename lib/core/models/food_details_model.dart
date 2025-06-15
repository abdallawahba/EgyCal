class FoodDetailsModel {
   String? engName;
   String? foodId;
   double? calories;
   double? proteins;
   double? fats;
   double? carbs;
   String? servingSize;
   double? totalFat;
   double? saturatedFat;
   double? transFat;
   double? polyunsaturatedFat;
   double? monounsaturatedFat;
   double? cholesterol;
   double? sodium;
   double? totalCarbohydrate;
   double? dietaryFiber;
   double? sugars;
   double? totalProtein;
   double? calcium;
   double? iron;
   double? potassium;
   double? vitaminA;
   double? vitaminC;
   double? vitaminD;
  bool isFavorite;

  FoodDetailsModel({
    this.engName,
    this.foodId,
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
  void assignName(String name) {
    engName = name;
  }
  void assignId(String id) {
    foodId = id;
  }
  void assignCalories(double calories) {
    this.calories = calories;
  }
  void assignProteins(double proteins) {
    this.proteins = proteins;
  }
  void assignFats(double fats) {
    this.fats = fats;
  }
  void assignCarbs(double carbs) {
    this.carbs = carbs;}
  void assignServingSize(String servingSize) {
    this.servingSize = servingSize;
  }
  void assignTotalFat(double totalFat) {
    this.totalFat = totalFat;
  }
  void assignSaturatedFat(double saturatedFat) {
    this.saturatedFat = saturatedFat;}
  void assignTransFat(double transFat) {
    this.transFat = transFat;
  }
  void assignPolyunsaturatedFat(double polyunsaturatedFat) {
    this.polyunsaturatedFat = polyunsaturatedFat;
  }
  void assignMonounsaturatedFat(double monounsaturatedFat) {
    this.monounsaturatedFat = monounsaturatedFat;}
  void assignCholesterol(double cholesterol) {
    this.cholesterol = cholesterol;
  }
  void assignSodium(double sodium) {
    this.sodium = sodium;}
  void assignTotalCarbohydrate(double totalCarbohydrate) {
    this.totalCarbohydrate = totalCarbohydrate;
  }
  void assignDietaryFiber(double dietaryFiber) {
    this.dietaryFiber = dietaryFiber;
  }
  void assignSugars(double sugars) {
    this.sugars = sugars;}
  void assignTotalProtein(double totalProtein) {
    this.totalProtein = totalProtein;
  }
  void assignCalcium(double calcium) {
    this.calcium = calcium;
  }
  void assignIron(double iron) {
    this.iron = iron;}
  void assignPotassium(double potassium) {
    this.potassium = potassium;
  }
  void assignVitaminA(double vitaminA) {
    this.vitaminA = vitaminA;
  }
  void assignVitaminC(double vitaminC) {
    this.vitaminC = vitaminC;}
  void assignVitaminD(double vitaminD) {
    this.vitaminD = vitaminD;
  }
  void assignIsFavorite(bool isFavorite) {
    this.isFavorite = isFavorite;
  }
}
