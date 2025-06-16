import 'package:egycal/features/profile/about_app.dart';
import 'package:egycal/features/profile/contact_us.dart';import 'package:egycal/features/profile/widgets/account_button.dart';
import 'package:egycal/features/profile/widgets/icon_name.dart';
import 'package:egycal/features/profile/widgets/info_row.dart';
import 'package:egycal/features/profile/widgets/red_icon.dart';
import 'package:egycal/features/users_data/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
                child: AvatarWidget(
              image: 'assets/images/Ellipse 11.png', onTap: () {  },
            )),
            const Text(
              'Ahmed',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'Ahmed@gmail.com',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: AccountButton(),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: InfoRow(
                title: 'Calorie intake',
                value: '3500 Cal',
              ),
            ),
            
            //divider
            Container(
              color: Colors.black,
              width: 350,
              height: 1,
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
              onpressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}