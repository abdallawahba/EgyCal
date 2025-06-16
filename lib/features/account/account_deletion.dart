import 'package:egycal/core/widgets/custom_outlined_button.dart';
import 'package:egycal/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AccountDeletion extends StatelessWidget {
  const AccountDeletion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text('account Deletion'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pushReplacementNamed(context, '/account'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: CustomText(
                  title: 'Are you sure you want to \n delete your account ?',
                  description: ''),
            ),
            SizedBox(height: 40.h,),
            CustomOutlinedButton(
             text: 'Yes',
            //  isSelected: ,
             onTap: (){

             },
            ),
            CustomOutlinedButton(
             text: 'No',
            //  isSelected: ,
             onTap: (){
               Navigator.pushReplacementNamed(context, '/account');
             },
            ),
            
          ],
        ),
      ),
    );
  }
}