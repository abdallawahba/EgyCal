import 'package:egycal/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.buttonName, required this.onPressedFun});
  final String buttonName;
  final VoidCallback onPressedFun;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressedFun(),
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        fixedSize: Size(312, 52),
        padding: EdgeInsets.symmetric(horizontal: 24.r,vertical: 12.r),
      ),
      child: Text(
        buttonName,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
