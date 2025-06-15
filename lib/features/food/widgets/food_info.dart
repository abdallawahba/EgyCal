import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/models/food_details_model.dart';
import '../../../core/services/handle_favorites_service.dart';

class FoodInfo extends StatefulWidget {
  final FoodDetailsModel food;

  const FoodInfo({super.key, required this.food});

  @override
  State<FoodInfo> createState() => _FoodInfoState();
}

class _FoodInfoState extends State<FoodInfo> {
  late bool isFav = widget.food.isFavorite;

  @override
  Widget build(BuildContext context) {
    bool isAdded = widget.food.foodId!.contains(widget.food.engName!);
    return Container(
      height: 150.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2B5E62), Color(0xFF438F95)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(17.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.food.engName!.length > 21 ? widget.food.engName!.substring(0, 21):  widget.food.engName!,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 22.w),
                      ],
                    ),
                    Text(
                      "${widget.food.calories} kcal",
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 45,
            right: 5,
            child: IconButton(
              icon: !isAdded ? Icon(
                size: 30,
                isFav ? Icons.favorite : Icons.favorite_border,
                color: Colors.red.shade700,
              ) : Icon(null),
              onPressed: () async {
                await handleFavorites(widget.food);
                setState(() {
                  isFav = !isFav;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
