import 'package:egycal/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextCustomButton extends StatelessWidget {
  final PageController pageController ;
  final VoidCallback onPressedFun;
  const NextCustomButton({super.key, required this.pageController,required this.onPressedFun});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned(
            top: 735.h,
            left: 290.w,
            child: ElevatedButton(
              onPressed: ()=>onPressedFun(),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20.r),
                backgroundColor: kPrimaryColor,
          ),
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
          ),
        ),
      ),
    ]);
  }
}
