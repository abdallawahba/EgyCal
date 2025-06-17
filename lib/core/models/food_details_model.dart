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
   double? quantity;
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
    this.quantity = 0,
  });

  factory FoodDetailsModel.fromJson(Map<String, dynamic> json) {
    return FoodDetailsModel(
      engName: json['engName'],
      foodId: (json['food_id'] ?? json['foodId'])?.toString(),
      calories: double.tryParse(json['calories']?.toString() ?? '0'),
      proteins: double.tryParse(json['proteins']?.toString() ?? '0'),
      fats: double.tryParse(json['fats']?.toString() ?? '0'),
      carbs: double.tryParse(json['carbs']?.toString() ?? '0'),
      servingSize: json['servingSize']?.toString() ?? '100 g',
      totalFat: double.tryParse(
          (json['totalFat'] ?? json['totalFat(g)'])?.toString() ?? '0'),
      saturatedFat: double.tryParse(
          (json['saturatedFat'] ?? json['saturatedFat(g)'])?.toString() ?? '0'),
      transFat: double.tryParse(
          (json['transFat'] ?? json['transFat(g)'])?.toString() ?? '0'),
      polyunsaturatedFat: double.tryParse(
          (json['polyunsaturatedFat'] ?? json['polyunsaturatedFat(g)'])
                  ?.toString() ??
              '0'),
      monounsaturatedFat: double.tryParse(
          (json['monounsaturatedFat'] ?? json['monounsaturatedFat(g)'])
                  ?.toString() ??
              '0'),
      cholesterol: double.tryParse(
          (json['cholesterol'] ?? json['cholesterol(mg)'])?.toString() ?? '0'),
      sodium:
          double.tryParse((json['sodium'] ?? json['sodium(mg)'])?.toString() ?? '0'),
      totalCarbohydrate: double.tryParse(
          (json['totalCarbohydrate'] ?? json['totalCarb(g)'])?.toString() ??
              '0'),
      dietaryFiber:
          double.tryParse(json['dietaryFiber']?.toString() ?? '0'),
      sugars:
          double.tryParse((json['sugars'] ?? json['sugars(g)'])?.toString() ?? '0'),
      totalProtein: double.tryParse(
          (json['totalProtein'] ?? json['totalProtein(g)'])?.toString() ?? '0'),
      calcium: double.tryParse(
          (json['calcium'] ?? json['calcium(mg)'])?.toString() ?? '0'),
      iron: double.tryParse((json['iron'] ?? json['iron(mg)'])?.toString() ?? '0'),
      potassium: double.tryParse(
          (json['potassium'] ?? json['potassium(mg)'])?.toString() ?? '0'),
      vitaminA: double.tryParse(
          (json['vitaminA'] ?? json['vitaminA(mg)'])?.toString() ?? '0'),
      vitaminC: double.tryParse(
          (json['vitaminC'] ?? json['vitaminC(mg)'])?.toString() ?? '0'),
      vitaminD: double.tryParse(
          (json['vitaminD'] ?? json['vitaminD(mg)'])?.toString() ?? '0'),
      isFavorite: json['isFavorite'] ?? false,
      quantity: double.tryParse(json['quantity']?.toString() ?? '0'),
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
      'quantity': quantity,
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
  void assignQuantity(double quantity) {
    this.quantity = quantity;
  }
}
