import 'package:egycal/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/models/user_data_model.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 120.h,
            left: 45.w,
            child: Image.asset('assets/images/black_icon.png',
              height: 300.h,
              width: 300.w,
            ),
          ),
          Positioned(
            top: 325.h,
            left: 148.w,
            child: Text('Welcome',
              style: TextStyle(
                  fontFamily: kInterFont,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
              ),
            ),
          ),
          Positioned(
            top: 365.h,
            left: 68.w,
            child: Text('Start or sign in to your account',
              style: TextStyle(
                  fontFamily: kInterFont,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: kSubTitlesColor
              ),),
          ),
          Positioned(
            bottom: 190.h,
            left: 25.w,
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/NameAndBirthDate');
              Provider.of<UserDataModel>(context, listen: false).usingGoogle = true;
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    fixedSize: Size(312, 52),
                    padding: EdgeInsets.symmetric(horizontal: 24,vertical: 12)

                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 43.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                        width: 30.h,
                        child: Image.asset(
                            'assets/images/google_logo.png',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.r),
                        child: Text('Sign-in with Google',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: kInterFont,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
          Positioned(
            bottom: 115.h,
            left: 25.w,
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/logInWithEmail');
              Provider.of<UserDataModel>(context, listen: false).usingGoogle = true;
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor: kSecondaryColor,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    fixedSize: Size(312, 52),
                    padding: EdgeInsets.symmetric(horizontal: 24,vertical: 12)

                ),
                child: Center(
                  child: Text('Log in using email',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: kInterFont,
                      fontSize: 16,
                    ),
                  ),
                )
            ),
          ),
          Positioned(
            bottom: 45.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sign up using email ?',
                  style: TextStyle(
                    fontFamily: kInterFont,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: kSubTitlesColor
                  ),
                ),
                TextButton(
                    onPressed: (){
                     Navigator.pushNamed(context, '/signUpWithEmail');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(left: 5.r),
                      minimumSize: Size(0,0),
                    ),
                    child: Text('sign up ',
                    style: TextStyle(
                      fontFamily: kInterFont,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: kSecondaryColor,
                      ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
