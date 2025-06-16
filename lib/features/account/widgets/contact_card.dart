import 'package:egycal/core/utils/constants.dart';
import 'package:egycal/core/widgets/custom_elevated_button.dart';
import 'package:egycal/features/account/widgets/icon_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/models/current_users_data_model.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({super.key});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendEmail() async {
    final String message = _messageController.text;
    final String email =
        Provider.of<CurrentUserDataModel>(context, listen: false).email!;
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'abdallawahba539@gmail.com',
      queryParameters: {
        'subject': 'Contact Us from $email',
        'body': message,
      },
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not launch email client.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 316.w,
      height: 420.h,
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
            padding: EdgeInsets.all(15.r),
            child: Center(
              child: Text('Contact Info', 
              style: TextStyle(
                fontFamily: kInterFont,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600
              ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: IconName(icon: Icons.email_outlined, tittle: Provider.of<CurrentUserDataModel>(context, listen: false).email!, onpress:(){}),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: IconName(icon: Icons.send, tittle: 'abdallawahba539@gmail.com', onpress:(){}),
          ),
            SizedBox(height: 16.h),
          TextField(controller: _messageController,
          maxLines: 4,
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
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.only(left: 70.r,right: 70.r),
            child: CustomElevatedButton(buttonName: 'Send', onPressedFun: _sendEmail),
          )

        ],
        
      ),
    );
  }
}