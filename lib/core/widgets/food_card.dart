import 'package:egycal/core/models/food_details_model.dart';
import 'package:egycal/core/services/log_food_service.dart';
import 'package:egycal/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../models/current_users_data_model.dart';
import '../services/unlog_food.service.dart';

class FoodCard extends StatefulWidget {
  final FoodDetailsModel food;
  const FoodCard({super.key, required this.food});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool isLogged = false;

  @override
  void initState() {
    super.initState();
    _checkIfFoodIsLogged();
  }

  void _checkIfFoodIsLogged() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    final date = DateTime.now().toIso8601String().split('T').first;
    final foodId = widget.food.foodId;
    if (foodId == null) {
      return;
    }
    final docId = '${foodId}_$date';
    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('loggedFood')
        .doc(docId);

    final docSnapshot = await docRef.get();
    if (mounted) {
      setState(() {
        isLogged = docSnapshot.exists;
      });
    }
  }

  Future<double?> _showQuantityDialog(BuildContext context) async {
    final TextEditingController controller = TextEditingController();
    return showDialog<double>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter the quantity'),
          content: TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(hintText: "According to the serving size. (grams or number of servings)"),
            autofocus: true,
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Log food'),
              onPressed: () {
                final double? quantity = double.tryParse(controller.text);
                if (quantity != null && quantity >= 0) {
                  Navigator.of(context).pop(quantity);
                }
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.r),
      child: Container(
        height: 75.h,
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.87),
          borderRadius: BorderRadius.circular(18.r),
        ),
        padding: EdgeInsets.only(top:10.r,bottom: 10.r, left: 20.r, right: 12.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.food.engName!.length > 18
                      ? '${widget.food.engName!.substring(0, 18)}...'
                      : widget.food.engName!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Text('${widget.food.calories?.toStringAsFixed(1) ?? '--'} kcal',
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),
            IconButton(
               icon: !isLogged ? const Icon(
                 Icons.add_circle_outline,
                 color: Colors.white,
               ) : const Icon(Icons.check,
                   color: Colors.white),
               onPressed: () async {
                 final quantity = await _showQuantityDialog(context);
                 final userModel = Provider.of<CurrentUserDataModel>(context, listen: false);
                 if (quantity == 0) {
                   await unlogFood(widget.food, userModel);
                   if (mounted) {
                     setState(() {
                       isLogged = false;
                     });
                   }
                 } else if (quantity != null && quantity > 0) {
                   await logFood(widget.food, quantity, userModel);
                   if (mounted) {
                     setState(() {
                       isLogged = true;
                     });
                   }
                 }
               },
             ),
          ],
        ),
      ),
    );
  }
}
