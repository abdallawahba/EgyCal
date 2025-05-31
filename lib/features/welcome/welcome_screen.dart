//import 'package:egycal/features/login/login_screen.dart';
//import 'package:egycal/features/sign_up_with_email/sign_up_page_1.dart';
import 'package:egycal/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  color: kSubTittlesColor
              ),),
          ),
          Positioned(
            bottom: 115.h,
            left: 25.w,
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/splash');
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    fixedSize: Size(312, 52),
                    padding: EdgeInsets.symmetric(horizontal: 24,vertical: 12)

                ),
                child: Text('Start',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: kInterFont,
                    fontSize: 16,
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
                Text('don\'t have an account ?',
                  style: TextStyle(
                    fontFamily: kInterFont,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: kSubTittlesColor
                  ),
                ),
                TextButton(
                    onPressed: (){
                     Navigator.pushNamed(context, '/signUpWithEmail');
                    },
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
