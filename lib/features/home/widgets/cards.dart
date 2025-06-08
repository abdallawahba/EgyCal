import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback ?onTap;
  const Cards({super.key, required this.icon , required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        decoration: BoxDecoration(
          color: Color(0xFF152D2F),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Color(0xFFFFFFFF),),
              SizedBox(height: 8,),
              Text(label, style: TextStyle(fontFamily: 'Inter',color: Color(0xFFFFFFFF)),)
            ],
          ),
        ),
      ),
    );
  }
}
