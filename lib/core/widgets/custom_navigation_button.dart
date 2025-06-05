import 'package:egycal/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationButtons extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  const NavigationButtons(
      {super.key, required this.onBack, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25.r),
          child: TextButton(
              onPressed: onBack,
              child: Text(
                'Back',
                style: TextStyle(
                    fontFamily: kInterFont,
                    fontSize: 16,
                    color: kSubTitlesColor,
                    fontWeight: FontWeight.normal
                ),
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.r, right: 10.r),
          child: ElevatedButton(
            onPressed: onNext,
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
        )
      ],
    );
  }
}
