import 'package:egycal/core/models/current_users_data_model.dart';
import 'package:egycal/core/utils/constants.dart';
import 'package:egycal/features/reports/widgets/cal_line_chart.dart';
import 'package:egycal/features/reports/widgets/cal_record.dart';
import 'package:egycal/features/users_data/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CaloriesReportBody extends StatelessWidget {
  const CaloriesReportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(24.r),
          child: Row(
            children: [
              SizedBox(
                  width: 50.w,
                  height: 50.h,
                  child: AvatarWidget(
                    image: Provider.of<CurrentUserDataModel>(context, listen: false).avatar,
                    onTap: () {},
                  )),
              Padding(
                padding: EdgeInsets.only(left: 10.r),
                child: Text(
                  Provider.of<CurrentUserDataModel>(context, listen: false).firstName!,
                  style: TextStyle(
                    fontFamily: kInterFont,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.r),
          child: Row(
            children: [
              Text(
                "Calories",
                style: TextStyle(
                  fontFamily: kInterFont,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 10.r, left: 24.r, right: 24.r),
            child: CaloriesLineChart(data: {
              11: 1250,
              11.5: 1000,
              12: 1230,
              12.5: 1260,
              13: 1240,
              14: 1200,
              16: 1750,
              16.5: 1650,
              17: 1800
            })),
        Padding(
          padding: EdgeInsets.only(top: 10.r, left: 24.r, right: 24.r,bottom:  10.r),
          child: Row(
            children: [
              Text(
                "Records",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: kInterFont,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Icon(Icons.add)
            ],
          ),
        ),
        CalRecord(
          date: DateTime.now(),
          calories: 2000,
        ),
        CalRecord(
          date: DateTime.now(),
          calories: 2050,
        ),
        CalRecord(
          date: DateTime.now(),
          calories: 2500,
        ),
        CalRecord(
          date: DateTime.now(),
          calories: 2200,
        ),
        CalRecord(
          date: DateTime.now(),
          calories: 1900,
        ),
      ],
    );
  }
}