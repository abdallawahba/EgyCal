import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../core/models/current_users_data_model.dart';
import '../../../core/utils/constants.dart';

class CaloriesWheel extends StatefulWidget {
  const CaloriesWheel({super.key});

  @override
  State<CaloriesWheel> createState() => _CaloriesWheelState();
}

class _CaloriesWheelState extends State<CaloriesWheel> {
  @override

  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: true,
      animationDuration: 1000,
      radius: 80,
      lineWidth: 8,
      percent:Provider.of<CurrentUserDataModel>(context).progressPercent! <= 1 ? Provider.of<CurrentUserDataModel>(context).progressPercent! : 1,
      progressColor: Colors.white,
      backgroundColor: kSecondaryColor,
      circularStrokeCap: CircularStrokeCap.round,
      center: SizedBox(
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.r),
              child: Text(Provider.of<CurrentUserDataModel>(context).remaining.toString(),
                style: TextStyle(
                    fontFamily: kRobotoFont,
                    fontSize: 30.sp,
                    color: Colors.white,
                ),
              ),
            ),
            Text(
              'Remaining',
              style: TextStyle(
                fontFamily: kCarroisGothicFont,
                fontSize: 15.sp,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
