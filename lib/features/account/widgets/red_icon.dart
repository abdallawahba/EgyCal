import 'package:flutter/material.dart';

class RedIcon extends StatelessWidget {
  final IconData icon1;
  final String name;
  
  final VoidCallback onpressed;
  const RedIcon({
    super.key,
    required this.icon1,
    required this.name, required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: onpressed,
        icon: Icon(
          icon1,
          size: 25,
          color: Color(0xFFCB2030),
        ),
        label: Text(
          name,
          style: TextStyle(
              fontFamily: 'Inter', fontSize: 14, color: Color(0xFFCB2030)),
        ),
      ),
    );
  }
}