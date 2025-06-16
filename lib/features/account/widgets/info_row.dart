import 'package:egycal/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoRow extends StatelessWidget {
  final  String  title;
  final String value;

  
  const InfoRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 23.r, horizontal: 20.r),
      decoration: BoxDecoration(
          color: Color(0xFFDBFBED), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Text(title, style: TextStyle(fontSize: 14.sp,fontFamily: kInterFont),),
          Spacer(flex: 2,),
          Text(value,style: TextStyle(color: kPrimaryColor,fontSize: 14.sp,fontFamily: kInterFont),)
        ],
      ),
    );
  }
}