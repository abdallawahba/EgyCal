import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egycal/core/widgets/custom_navigation_button.dart';
import 'package:egycal/core/widgets/custom_text.dart';
import 'package:egycal/features/users_data/widgets/weight_and_height_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../core/models/current_users_data_model.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/helper.dart';
import '../../core/models/users_data_model.dart';

class Height extends StatefulWidget {
  const Height({
    super.key,
  });

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      progressIndicator: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(kSecondaryColor),
        strokeWidth: 3.0,
      ),
      opacity: 0.2,
      child: Scaffold(
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
              }, onNext: () async{
                if (Provider.of<UserDataModel>(context, listen: false)
                    .validateHeight()) {
                  if (Provider.of<UserDataModel>(context, listen: false)
                          .usingGoogle ==
                      false) {
                    Navigator.pushNamed(context, '/avatar');
                  } else {
                    _isLoading = true;
                    setState(() {});
                    try {
                      final user = FirebaseAuth.instance.currentUser;
                      if (user == null) {
                        throw Exception('No authenticated user found.');
                      }
                      final uid = user.uid;
                      final userData = Provider.of<UserDataModel>(context, listen: false).toMap();
                      Provider.of<CurrentUserDataModel>(context, listen: false).fetch();
                      await FirebaseFirestore.instance.collection('users').doc(uid).set(userData);
                      Navigator.pushReplacementNamed(context, '/home');
                      Provider.of<UserDataModel>(context, listen: false).clean();
                    } catch (e) {
                      showCustomSnackBar('Unexpected error has occurred', context);
                    }
                    _isLoading = false;
                    setState(() {});
                  }
                } else {
                  showCustomSnackBar(
                      "Please enter a valid height (120cm:240cm).", context);
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
