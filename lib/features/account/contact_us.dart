import 'package:egycal/features/account/widgets/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, 
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text('Contact Us'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pushReplacementNamed(context, '/account'),
        ),
      ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.r, left: 20.r, right: 20.r),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                   style: TextStyle(
                   color: Color(0xFF6E7179), 
                 fontSize: 16.sp,
                 fontFamily: 'Inter'
                 ),
                 children: [
                  TextSpan(
                    text: "Don't hesitate to contact us if you find a bug or have a suggestion. "
                      "We highly appreciate any feedback provided as it helps us improve your "
                  ),
                  TextSpan(
                    text: 'Calorie tracker',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                       color: Color(0xFF0F2C2D),
                    )
                  )
                 ]
                )),
              ),
            SizedBox(height:50.h,),
              ContactCard()
            ],
          ),
    );
  }
}