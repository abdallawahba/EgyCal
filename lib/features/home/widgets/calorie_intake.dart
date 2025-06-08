import 'package:egycal/features/users_data/widgets/avatar_widget.dart';
import 'package:egycal/features/home/widgets/custom_clipper.dart';
import 'package:egycal/features/home/widgets/calorie_wheel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/models/current_users_data_model.dart';
import '../../../core/utils/constants.dart';

class CalorieIntake extends StatelessWidget {
  const CalorieIntake({super.key});

  @override
  Widget build(BuildContext context) {
    //final percent = (progressPercent * 100).toStringAsFixed(0);
    //final baseGoal = goal.toInt();
    return ClipPath(
      clipper: Customclipper(),
      child: Container(
        width: double.infinity,
        height: 360.h,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors:[kPrimaryColor,Color(0xFF438F95)],
              begin: Alignment.bottomRight,
              end: Alignment.topRight,
            )
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 45.r,left: 10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.r, top: 8.r, bottom: 8.r, right: 12.r),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            width: 30.w,
                            height: 30.w,
                            child: AvatarWidget(image: Provider.of<CurrentUserDataModel>(context, listen: false).avatar, onTap: () {},)),
                        SizedBox(width: 8.w,),
                        Text("Good morning, ${Provider.of<CurrentUserDataModel>(context).firstName}", style: TextStyle(
                            color: Colors.white
                        ),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.r, top: 25.r),
                    child: Text(
                      'Your progress',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: kRobotoFont,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.r, top: 0.r),
                    child: Text(
                      '${Provider.of<CurrentUserDataModel>(context).progressPercent! * 100}%',
                      style: TextStyle(
                        fontSize: 45.sp,
                        fontFamily: kRobotoFont,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.r, top: 12.r),
                    child: Text(
                      'Base Goal',
                      style: TextStyle(
                        fontSize: 23.sp,
                        fontFamily: kRobotoFont,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.r,bottom: 15.r),
                    child: Text(
                      '${Provider.of<CurrentUserDataModel>(context).baseGoal.toString()} Cal',
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontFamily: kRobotoFont,
                        color: Colors.white,

                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                width: 120.h,
                height: 235.h,
                child: Padding(
                  padding:  EdgeInsets.only(top: 35.r),
                  child: CaloriesWheel(),
                )
            ),

          ],
        ),
      ),
    );
  }
}
