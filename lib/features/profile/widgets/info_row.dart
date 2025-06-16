import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final  String  title;
  final String value;

  
  const InfoRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 20),
      decoration: BoxDecoration(
          color: Color(0xFFDBFBED), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Text(title, style: TextStyle(fontSize: 14,fontFamily: 'Inter'),),
          Spacer(flex: 2,),
          Text(value,style: TextStyle(color: Color(0xFF35CC8C),fontSize: 14,fontFamily: 'Inter'),)
        ],
      ),
    );
  }
}