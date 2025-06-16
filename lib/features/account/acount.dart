import 'package:egycal/core/models/current_users_data_model.dart';
import 'package:egycal/core/utils/constants.dart';
import 'package:egycal/features/account/widgets/icon_name.dart';
import 'package:egycal/features/account/widgets/red_icon.dart';
import 'package:egycal/features/users_data/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            Center(
                child: AvatarWidget(
              image: Provider.of<CurrentUserDataModel>(context, listen: false).avatar,
              onTap: () {},
            )),
            SizedBox(
              height: 10.h,
            ),
            Text(
              Provider.of<CurrentUserDataModel>(context, listen: false).email!,
              style: TextStyle(
                fontFamily: kInterFont,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            //divider
            SizedBox(
              height: 30.h,
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
                  padding: EdgeInsets.all(20.r),
                  child: Text(
                    '${Provider.of<CurrentUserDataModel>(context, listen: false).firstName!} ${Provider.of<CurrentUserDataModel>(context, listen: false).lastName!}',
                    style: TextStyle(
                      fontFamily: kInterFont,
                      fontSize: 18.sp,
                    ),
                  ),
                )
              ],
            ),
            //divider
            SizedBox(
              height: 10.h,
            ),
            Container(
              color: Colors.black,
              width: 350.w,
              height: 1.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            //icons
            RedIcon(
              icon1: Icons.logout_outlined,
              name: 'Logout',
              onpressed: () {},
            ),
            RedIcon(
              icon1: Icons.delete_outlined,
              name: 'Delete account',
              onpressed: () => Navigator.pushReplacementNamed(context, '/accountDeletion'),
            ),
          ],
        ),
      ),
    );
  }
}
