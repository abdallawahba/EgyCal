import 'package:egycal/core/widgets/food_card.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/services/retrieve_favorites.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/bottom_nav_bar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/home');
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: 80,
          title: const Text('Favorites'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
        ),
        body: FutureBuilder(
          future: _loadFavorites(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(
                color:kSecondaryColor,
                strokeWidth: 3.r,
              ));
            } else if (snapshot.hasError) {
              return const Center(child: Text('Failed to load favorites.'));
            } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
              return const Center(child: Text('No favorites yet.'));
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
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }

  Future<List> _loadFavorites() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      debugPrint('❌ No user logged in');
      return [];
    }
    return await fetchFavoriteFoodsFromFirebase(user.uid);
  }
}
