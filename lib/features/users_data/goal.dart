import 'package:egycal/core/helper.dart';
import 'package:egycal/core/models/user_data_model.dart';
import 'package:egycal/core/widgets/custom_navigation_button.dart';
import 'package:egycal/core/widgets/custom_outlined_button.dart';
import 'package:egycal/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Goal extends StatefulWidget {
  const Goal({
    super.key,
  });

  @override
  State<Goal> createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  String? selectedGoal;

  void _handleGoalSelection(String goal) {
    setState(() {
      if (selectedGoal != goal) {
        selectedGoal = goal;
        Provider.of<UserDataModel>(context, listen: false).saveGoal(goal);
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
                  title: "What's your goal?",
                  description:
                      "We will calculate daily calories \n      according to your goal"),
              SizedBox(
                height: 170.h,
              ),
              CustomOutlinedButton(
                text: 'Lose Weight',
                isSelected: selectedGoal == 'Lose Weight',
                onTap: () {
                  _handleGoalSelection('Lose Weight');
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomOutlinedButton(
                text: 'Keep weight',
                isSelected: selectedGoal == 'Keep weight',
                onTap: () {
                  _handleGoalSelection('Keep weight');
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomOutlinedButton(
                text: 'Gain Weight',
                isSelected: selectedGoal == 'Gain Weight',
                onTap: () {
                  _handleGoalSelection('Gain Weight');
                },
              ),
              SizedBox(
                height: 125.h,
              ),
              NavigationButtons(onBack: () {
                Navigator.pop(context);
              }, onNext: () {
                if (Provider.of<UserDataModel>(context, listen: false)
                    .validateGoal()) {
                  Navigator.pushNamed(context, '/gender');
                } else {
                  showCustomSnackBar("Please select your goal.", context);
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
