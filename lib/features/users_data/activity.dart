import 'package:egycal/core/utils/helper.dart';
import 'package:egycal/core/models/users_data_model.dart';
import 'package:egycal/core/widgets/custom_navigation_button.dart';
import 'package:egycal/core/widgets/custom_outlined_button.dart';
import 'package:egycal/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Activity extends StatefulWidget {
  const Activity({
    super.key,
  });

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  String? selectedActivity;

  void _handleActivitySelection(String activity) {
    setState(() {
      if (selectedActivity != activity) {
        selectedActivity = activity;
        Provider.of<UserDataModel>(context, listen: false).saveActivity(activity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 60.r, left: 30.r, right: 30.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                  title: "How active are you?",
                  description:
                      "A sedentary person burns fewer \n calories than an active person"),
              SizedBox(
                height: 150.h,
              ),
              CustomOutlinedButton(
                text: 'Sedentary',
                isSelected: selectedActivity == 'Sedentary',
                onTap: () {
                  _handleActivitySelection('Sedentary');
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomOutlinedButton(
                text: 'Low Active',
                isSelected: selectedActivity == 'Low Active',
                onTap: () {
                  _handleActivitySelection('Low Active');
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomOutlinedButton(
                text: 'Active',
                isSelected: selectedActivity == 'Active',
                onTap: () {
                  _handleActivitySelection('Active');
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomOutlinedButton(
                text: 'Very Active',
                isSelected: selectedActivity == 'Very Active',
                onTap: () {
                  _handleActivitySelection('Very Active');
                },
              ),
              SizedBox(
                height: 75.h,
              ),
              NavigationButtons(onBack: () {
                Navigator.pop(context);
              }, onNext: () {
                if (Provider.of<UserDataModel>(context, listen: false)
                    .validateActivity()) {
                  Navigator.pushNamed(context, '/weight');
                } else {
                  showCustomSnackBar(
                      "Please select your activity level.", context);
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
