import 'package:egycal/core/models/food_details_model.dart';
import 'package:egycal/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/services/add_food_service.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/bottom_nav_bar.dart';
import '../../core/widgets/custom_elevated_button.dart';

class AddFoodPage extends StatefulWidget {
  const AddFoodPage({super.key});

  @override
  State<AddFoodPage> createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  final FoodDetailsModel food = FoodDetailsModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text('Add Food'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(17.r),
        child: Column(
          children: [
            _buildTextField('Food Name', (val) => food.assignName(val)),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSmallTextField('Calories(kcal)',
                    (val) => food.assignCalories(double.tryParse(val) ?? 0)),
                _buildSmallTextField('Proteins(%)',
                    (val) => food.assignProteins(double.tryParse(val) ?? 0)),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSmallTextField(
                    'Fats(%)', (val) => food.assignFats(double.tryParse(val) ?? 0)),
                _buildSmallTextField(
                    'Carbs(%)', (val) => food.assignCarbs(double.tryParse(val) ?? 0)),
              ],
            ),
             SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSmallTextField('Total Fats(g)',
                        (val) => food.assignTotalFat(double.tryParse(val) ?? 0)),
                _buildSmallTextField('Saturated Fats(g)',
                        (val) => food.assignSaturatedFat(double.tryParse(val) ?? 0)),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSmallTextField('Polyunsaturated Fat(g)',
                        (val) => food.assignPolyunsaturatedFat(double.tryParse(val) ?? 0)),
                _buildSmallTextField('Monounsaturated Fat(g)',
                        (val) => food.assignMonounsaturatedFat(double.tryParse(val) ?? 0)),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSmallTextField('Cholesterol(mg)',
                        (val) => food.assignCholesterol(double.tryParse(val) ?? 0)),
                _buildSmallTextField('Sodium(mg)',
                        (val) => food.assignSodium(double.tryParse(val) ?? 0)),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSmallTextField('Total Carb(g)',
                        (val) => food.assignTotalCarbohydrate(double.tryParse(val) ?? 0)),
                _buildSmallTextField('Dietary Fiber(g)',
                        (val) => food.assignDietaryFiber(double.tryParse(val) ?? 0)),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSmallTextField('Sugar(g)',
                        (val) => food.assignSugars(double.tryParse(val) ?? 0)),
                _buildSmallTextField('Total Protein(g)',
                        (val) => food.assignTotalProtein(double.tryParse(val) ?? 0)),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSmallTextField('Vitamin D(mg)',
                        (val) => food.assignVitaminD(double.tryParse(val) ?? 0)),
                _buildSmallTextField('Calcium(mg)',
                        (val) => food.assignCalcium(double.tryParse(val) ?? 0)),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSmallTextField('Iron(mg)',
                        (val) => food.assignIron(double.tryParse(val) ?? 0)),
                _buildSmallTextField('Potassium(mg)',
                        (val) => food.assignPotassium(double.tryParse(val) ?? 0)),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSmallTextField('Vitamin A(mg)',
                        (val) => food.assignVitaminA(double.tryParse(val) ?? 0)),
                _buildSmallTextField('Vitamin C(mg)',
                        (val) => food.assignVitaminC(double.tryParse(val) ?? 0)),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomElevatedButton(
              onPressedFun: () async {
                if (food.engName == null ||
                    food.engName!.trim().isEmpty ||
                    food.calories == null ||
                    food.proteins == null ||
                    food.fats == null ||
                    food.carbs == null) {
                  showCustomSnackBar(
                      'Food Name, Calories(kcal), Proteins(%), Fats(%) and Carbs(%) are necessary fields',
                      context);
                } else {
                  try {
                    final bool added = await addFood(food);
                    if (added) {
                      showCustomSnackBar('Food added successfully!', context);
                      if (mounted) {
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    } else {
                      showCustomSnackBar(
                          'This food item already exists.', context);
                    }
                  } catch (e) {
                    showCustomSnackBar(
                        'An error occurred: ${e.toString()}', context);
                  }
                }
              },
              buttonName: 'Add Food',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontFamily: kInterFont,
              color: Colors.black,
              fontSize: 12,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(16))),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildSmallTextField(String hint, Function(String) onChanged) {
    return SizedBox(
      width: 140.w,
      height: 60.h,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontFamily: kInterFont,
              fontSize: 11.sp,
              color: Color(0xFF0D1220),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(16))),
        onChanged: onChanged,
      ),
    );
  }
}
