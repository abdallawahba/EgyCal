import 'package:egycal/core/widgets/custom_navigation_button.dart';
import 'package:egycal/core/widgets/custom_text.dart';
import 'package:egycal/features/users_data/widgets/weight_and_height_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/utils/helper.dart';
import '../../core/models/user_data_model.dart';

class Weight extends StatefulWidget {
  const Weight({
    super.key,
  });

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          SizedBox(height: 100.r),
          Center(
            child: CustomText(
                title: "What's your weight ?",
                description:
                    "The more you weigh, the more \n      calories your body burns"),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.r),
                child: WeightAndHeightPicker(unit: 'KG'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.r, right: 30.r, bottom: 35.r),
            child: NavigationButtons(onBack: () {
              Navigator.pop(context);
            }, onNext: () {
              if (Provider.of<UserDataModel>(context, listen: false)
                  .validateWeight()) {
                Navigator.pushNamed(context, '/height');
              } else {
                showCustomSnackBar(
                    "Please enter a valid weight (20kg:240kg).", context);
              }
            }),
          )
        ],
      ),
    );
  }
}
