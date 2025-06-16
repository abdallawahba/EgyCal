import 'package:egycal/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF122D2E),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          padding: EdgeInsets.symmetric(vertical: 23.r, horizontal: 20.r),
          elevation: 0,
        ),
        onPressed: () => Navigator.pushReplacementNamed(context, '/account'),
        child: Row(
          children: [
            Text(
              'Account',
              style: TextStyle(
                  fontFamily: kInterFont, fontSize: 14.sp, color: Colors.white)),
            Spacer(
              flex: 2,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 16,
            )
          ],
        ));
  }
}