import 'package:egycal/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewitem extends StatelessWidget {
  const PageViewitem({super.key, this.tittle, this.subtittle, this.image});
  final String? tittle;
  final String? subtittle;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 225.h,
        ),
        SizedBox(
            height:230.h,
            child:  SvgPicture.asset(image!)
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(tittle!,
          style: TextStyle(
              fontFamily: kInterFont,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: kTitlesColor,
          ),),
        SizedBox(
          height: 10.h,

        ),
        Text(subtittle!,
          style: TextStyle(
            fontFamily: kInterFont,
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: kSubTittlesColor,
          ),
        ),
      ],
    );
  }
}
