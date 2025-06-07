import 'package:egycal/core/utils/helper.dart';
import 'package:egycal/core/models/user_data_model.dart';
import 'package:egycal/core/widgets/custom_navigation_button.dart';
import 'package:egycal/core/widgets/custom_outlined_button.dart';
import 'package:egycal/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Gender extends StatefulWidget {
  const Gender({
    super.key,
  });

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String? selectedGender;

  void _handleGenderSelection(String gender) {
    setState(() {
      if (selectedGender != gender) {
        selectedGender = gender;
        Provider.of<UserDataModel>(context, listen: false).saveGender(gender);
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
                  title: "What’s your gender?",
                  description:
                      "Different bodies, different energy \n                      needs."),
              SizedBox(
                height: 150.h,
              ),
              CustomOutlinedButton(
                text: 'Male',
                isSelected: selectedGender == 'Male',
                onTap: () {
                  _handleGenderSelection('Male');
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomOutlinedButton(
                text: 'Female',
                isSelected: selectedGender == 'Female',
                onTap: () {
                  _handleGenderSelection('Female');
                },
              ),
              SizedBox(
                height: 200.h,
              ),
              NavigationButtons(onBack: () {
                Navigator.pop(context);
              }, onNext: () {
                if (Provider.of<UserDataModel>(context, listen: false)
                    .validateGender()) {
                  Navigator.pushNamed(context, '/activity');
                } else {
                  showCustomSnackBar("Please select your gender.", context);
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
