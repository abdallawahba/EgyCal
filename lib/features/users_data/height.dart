import 'package:egycal/core/widgets/custom_navigation_button.dart';
import 'package:egycal/core/widgets/custom_text.dart';
import 'package:egycal/features/users_data/widgets/weight_and_height_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/helper.dart';
import '../../core/models/user_data_model.dart';

class Height extends StatefulWidget {
  const Height({
    super.key,
  });

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {
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
                title: "What's your height ?",
                description:
                    "The taller you are, the more \n  calories your body needs"),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.r),
                child: WeightAndHeightPicker(unit: 'CM'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.r, right: 30.r, bottom: 35.r),
            child: NavigationButtons(onBack: () {
              Navigator.pop(context);
            }, onNext: () {
              if (Provider.of<UserDataModel>(context, listen: false)
                  .validateHeight()) {
                if (Provider.of<UserDataModel>(context, listen: false)
                        .usingGoogle ==
                    false) {
                  Navigator.pushNamed(context, '/avatar');
                } else {
                  Navigator.pushNamed(context, '/splash');
                }
              } else {
                showCustomSnackBar(
                    "Please enter a valid height (120cm:240cm).", context);
              }
            }),
          )
        ],
      ),
    );
  }
}
