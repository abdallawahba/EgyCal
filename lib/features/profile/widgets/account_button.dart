import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF122D2E),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.symmetric(vertical: 23, horizontal: 20),
          elevation: 0,
        ),
        onPressed: () => Navigator.pushReplacementNamed(context, '/account'),
        child: Row(
          children: [
            Text(
              'Account',
              style: TextStyle(
                  fontFamily: 'Inter', fontSize: 14, color: Color(0xFFFFFFFF)),
            ),
            Spacer(
              flex: 2,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 16,
            )
          ],
        ));
  }
}