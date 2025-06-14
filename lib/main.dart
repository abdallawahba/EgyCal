import 'package:egycal/core/models/current_users_data_model.dart';
import 'package:egycal/core/models/users_data_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/utils/constants.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EgyCal());
}

class EgyCal extends StatelessWidget {
  const EgyCal({super.key});
  @override
  Widget build(BuildContext context) {
    UserDataModel usersData = UserDataModel();
    CurrentUserDataModel currentUsersData = CurrentUserDataModel();

    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            Provider(create: (_) => usersData),
            Provider(create: (_) => currentUsersData),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/splash',
            routes: routes,
          ),
        );
      },
    );
  }
}
