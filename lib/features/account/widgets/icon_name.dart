import 'package:flutter/material.dart';

class IconName extends StatelessWidget {
  final IconData icon;
  final String tittle;
  final VoidCallback onpress;
  const IconName(
      {super.key,
      required this.icon,
      required this.tittle,
      required this.onpress,  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: onpress,
        icon: Icon(
          color: Colors.black,
          icon,
          size: 25,
        ),
        label: Text(tittle,
        style: TextStyle(
          fontFamily: 'Inter', fontSize: 14,color: Colors.black
        ),
        ),
      ),
    );
  }
}