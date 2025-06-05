import 'package:egycal/core/constants.dart';
import 'package:egycal/features/users_data/widgets/avatars_matrix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egycal/core/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../core/helper.dart';
import '../../core/models/user_data_model.dart';

class Avatar extends StatefulWidget {
  const Avatar({
    super.key,
  });
  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:Padding(
          padding: EdgeInsets.only(top: 75.r,left: 20.r, right: 25.r),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Icon(Icons.arrow_back,size: 32.sp,),
                    onTap: (){Navigator.pop(context);},
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left:5.r, right: 5.r, top: 5.r),
                child: CustomText(title: 'Select your Avatar',description: 'For more personalized experience',),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.r),
                child: AvatarsMatrix(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 115.r,left: 5.r, right: 5.r),
                child: ElevatedButton(onPressed: (){
                  if(Provider.of<UserDataModel>(context, listen: false).validateAvatar()){Navigator.pushNamed(context, '/splash');}
                  else{
                    showCustomSnackBar("Please select an avatar.", context);
                  }
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    fixedSize: Size(312, 52),
                    padding: EdgeInsets.symmetric(horizontal: 24,vertical: 12)
                  ),
                  child: Text('Continue', style: TextStyle(color: Colors.white, fontFamily: kInterFont, fontSize: 16),),),
              )
            ],
          ),
        )
    );
  }
}

