import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/services/retrieve_added_food.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/bottom_nav_bar.dart';
import '../../core/widgets/food_card.dart';

class AddedFoodPage extends StatelessWidget{
  const AddedFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text('Added Food'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      body: FutureBuilder(
        future: _loadAddedFoods(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(
              color:kSecondaryColor,
              strokeWidth: 3.r,
            ));
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load added foods.'));
          } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
            return const Center(child: Text('No added foods yet.'));
          }
          final filteredFoods = snapshot.data as List;
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 9.r, vertical: 21.r),
            itemCount: filteredFoods.length,
            itemBuilder: (context, index) {
              final food = filteredFoods[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/foodDetails', arguments: food);
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 12.r),
                  child: FoodCard(food: food),
                ),
              );
            },
          );
        },
      ),
    );
  }
  Future<List> _loadAddedFoods() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      debugPrint('❌ No user logged in');
      return [];
    }
    return await fetchAddedFoodsFromFirebase(user.uid);
  }
}