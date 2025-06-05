import 'package:egycal/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String title;
  final String description;

  const CustomText({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3.r),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: kInterFont,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: kTitlesColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            description,
            style: TextStyle(
                fontFamily: kInterFont,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: kSubTitlesColor),
          )
        ],
      ),
    );
  }
}
