import 'package:egycal/core/constants.dart'; // Assuming kSecondaryColor and kSubTittlesColor are defined here
import 'package:egycal/core/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WeightAndHeightPicker extends StatelessWidget {
  final String unit;
  const WeightAndHeightPicker({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                if (unit == 'KG') {
                  Provider.of<UserDataModel>(context, listen: false)
                      .saveWeight(
                          value.isEmpty ? null : double.tryParse(value));
                } else if (unit == 'CM') {
                  Provider.of<UserDataModel>(context, listen: false)
                      .saveHeight(
                          value.isEmpty ? null : double.tryParse(value));
                }
              },
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d{1,3}(\.\d{0,2})?'))
              ],
              decoration: InputDecoration(
                hintText: '0.0',
                hintStyle: TextStyle(color: kSubTitlesColor),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.r, horizontal: 12.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: kSecondaryColor,
                    width: 1.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: kPrimaryColor, width: 2.w),
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            unit,
            style: TextStyle(
              fontSize: 16.sp,
              color: kSubTitlesColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
