//import 'package:egycal/features/favorites/favorites_page.dart';
//import 'package:egycal/features/food_detailes/presentation/models/food_details_model.dart';
//import 'package:egycal/features/profile/presentation/screens/profile.dart';
//import 'package:egycal/features/search/presentation/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../utils/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  void _navigate(BuildContext context, int index) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    const routes = ['/home', '/favorites', '/addedFood', '/profile'];
    final newRoute = routes[index];
    if (currentRoute == newRoute) return;
    if (newRoute == '/home' && currentRoute == '/authWrapper') return;
    Navigator.pushNamed(context, newRoute);
  }
  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    int selectedIndex = 0;
    if (currentRoute == '/favorites') {
      selectedIndex = 1;
    } else if (currentRoute == '/addedFood') {
      selectedIndex = 2;
    } else if (currentRoute == '/profile') {
      selectedIndex = 3;
    }
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: GNav(
        selectedIndex: selectedIndex,
        onTabChange: (index) => _navigate(context, index),
        padding: EdgeInsets.all(16.r),
        backgroundColor: kPrimaryColor,
        color: Colors.white,
        activeColor: Colors.white,
        textStyle: const TextStyle(color: Colors.white),
        tabs: const [
          GButton(
            gap: 8,
            icon: Icons.home_outlined,
            text: 'Home',
          ),
          GButton(
            icon: Icons.favorite_outline_outlined,
            text: 'Favorites',
          ),
          GButton(
            icon: Icons.add_circle_outline,
            text: 'Added Food',
          ),
          GButton(
            icon: Icons.person_2_outlined,
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}
