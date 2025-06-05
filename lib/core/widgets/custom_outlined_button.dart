import 'package:egycal/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  const CustomOutlinedButton({
    required this.text,
    required this.onTap,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 312.w,
        height: 65.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? kPrimaryColor : Colors.white,
            )),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: kTitlesColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
