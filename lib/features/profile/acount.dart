import 'package:egycal/core/widgets/custom_elevated_button.dart';
import 'package:egycal/features/profile/widgets/icon_name.dart';
import 'package:egycal/features/profile/widgets/red_icon.dart';
import 'package:egycal/features/users_data/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text('Account'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pushReplacementNamed(context, '/profile'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all( 20),
        child: Column(
          children: [
            Center(
                child: AvatarWidget(
              image: 'assets/images/Ellipse 11.png',
              onTap: () {},
            )),
            SizedBox(
              height: 10,
            ),
            Text(
              'Ahmed@gmail.com',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            //divider
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconName(
                  icon: Icons.person_outline,
                  onpress: () {},
                  tittle: 'Name',
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Ahmed',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            //divider
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.black,
              width: 350,
              height: 1,
            ),
            SizedBox(
              height: 10,
            ),

            //icons
            IconName(
              icon: Icons.lock_reset_rounded,
              onpress: () => Navigator.pushReplacementNamed(context, '/changePassword'),
              tittle: 'change password',
            ),
            RedIcon(
              icon1: Icons.logout_outlined,
              name: 'Logout',
              onpressed: () {},
            ),
            RedIcon(
              icon1: Icons.delete_outlined,
              name: 'Delete Account',
              onpressed: () => Navigator.pushReplacementNamed(context, '/accountDeletion'),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewInsets.bottom > 0
                        ? 100.r
                        : 210.r,
                    bottom: 15.r),
                child: CustomElevatedButton(
                  buttonName: 'Save',
                  onPressedFun: () {},
                ),
              ),
          ],
        ),
      ),
    );
  }
}
