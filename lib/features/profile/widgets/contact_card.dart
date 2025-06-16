import 'package:egycal/core/widgets/custom_elevated_button.dart';
import 'package:egycal/features/profile/widgets/icon_name.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      height: 380,
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(
          color:  Color(0x1A000000),
        blurRadius: 10,
        offset: Offset(0, 2),
        )]
        
      ),
      child: Column(
         mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text('Contact Info', 
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w600
              
              ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: IconName(icon: Icons.email_outlined, tittle: 'Ahmed@gmail.com', onpress:(){}),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: IconName(icon: Icons.send, tittle: 'Ahmed@gmail.com', onpress:(){}),

          ),
            SizedBox(height: 16),
          TextField(maxLines: 4,
          
          decoration: 
          
          InputDecoration(
            hintText: 'I found a bug...',
            labelText: 'Message',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            alignLabelWithHint: true,
            
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFF152D2F),
          
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF152D2F),

          )
          ),
          labelStyle: TextStyle(color: Color(0xFF152D2F))
          ),
          
          ),
          SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.only(left: 70,right: 70),
            child: CustomElevatedButton(buttonName: 'Send', onPressedFun:(){}),
          )


        ],
        
      ),
    );
  }
}