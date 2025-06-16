import 'package:egycal/core/models/current_users_data_model.dart';
import 'package:egycal/core/utils/constants.dart';
import 'package:egycal/features/account/about_app.dart';
import 'package:egycal/features/account/contact_us.dart';
import 'package:egycal/features/account/widgets/account_button.dart';
import 'package:egycal/features/account/widgets/icon_name.dart';
import 'package:egycal/features/account/widgets/info_row.dart';
import 'package:egycal/features/account/widgets/red_icon.dart';
import 'package:egycal/features/users_data/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            Center(
                child: AvatarWidget(
                image: Provider.of<CurrentUserDataModel>(context, listen: false).avatar, onTap: () {  },
            )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.r),
              child: Text(
                Provider.of<CurrentUserDataModel>(context, listen: false).firstName!,
                style: TextStyle(
                  fontFamily: kInterFont,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.r),
              child: Text(
                Provider.of<CurrentUserDataModel>(context, listen: false).email!,
                style: TextStyle(
                  fontFamily: kInterFont,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.r),
              child: AccountButton(),
            ),
            Padding(
              padding: EdgeInsets.all(6.r),
              child: InfoRow(
                title: 'Calorie Intake',
                value: Provider.of<CurrentUserDataModel>(context, listen: false).baseGoal.toString(),
              ),
            ),
            //divider
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.r),
              child: Container(
                color: Colors.black,
                width: 350.w,
                height: 1.h,
              ),
            ),
            //Icons
            IconName(
              icon: Icons.email_outlined,
              onpress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ContactUs()));
              },
              tittle: 'Contact us',
            ),
            IconName(
              icon: Icons.info_outline_rounded,
              onpress: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const AboutApp()));
              },
              tittle: 'About app',
            ),
            RedIcon(
              icon1: Icons.logout_outlined,
              name: 'Logout',
              onpressed: () async {
                await FirebaseAuth.instance.signOut();
                final googleSignIn = GoogleSignIn();
                if (await googleSignIn.isSignedIn()) {
                await googleSignIn.signOut();
                }
                Provider.of<CurrentUserDataModel>(context, listen: false).clean();
                Navigator.of(context).pushNamedAndRemoveUntil('/authWrapper', (route) => false,);
              },
            ),
          ],
        ),
      ),
    );
  }
}