import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CalRecord extends StatelessWidget{
  final DateTime date;
  final int calories;
  const CalRecord({super.key, required this.date, required this.calories});
  String get formattedDate => DateFormat('MMM d, y').format(date);
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(left:24.r, right: 24.r, bottom:10.r),
      child: Container(
          width: 328,
          height: 39,
          decoration: BoxDecoration(
            color: Color(0xfff7f7f7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:15),
            child: Row(
              children: [
                Text(
                  formattedDate,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:150),
                  child: Container(
                    width: 60,
                    height: 15,
                    alignment: Alignment.center,
                    child: Text(
                      '$calories cal',
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}