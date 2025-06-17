import 'package:egycal/core/models/current_users_data_model.dart';
import 'package:egycal/core/widgets/bottom_nav_bar.dart';
import 'package:egycal/features/diary/widgets/avatar.dart';
import 'package:egycal/features/diary/widgets/nutrients_indicator.dart';
import 'package:egycal/features/diary/widgets/water_intake_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:egycal/core/services/retrieve_logged_food_service.dart';
import 'package:egycal/core/models/food_details_model.dart';
import 'package:egycal/core/widgets/food_card.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});
  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentUserDataModel>(
      builder: (context, userData, child) {
        return GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy > 0) {
                userData.fetch();
              }
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    avatarImage(
                      image: userData.avatar,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      userData.firstName ?? 'User',
                      style:
                          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Nutrients Indicator',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    NutrientsIndicator(),
                    SizedBox(height: 20.h),
                    Text('Water Intake',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.sp),
                    WaterCard(),
                    SizedBox(height: 20.sp),
                    StreamBuilder<List<FoodDetailsModel>>(
                      stream: retrieveLoggedFood(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return const Center(
                              child: Text('Something went wrong'));
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(
                              child: Text('No food logged yet.'));
                        }
                        final loggedFoods = snapshot.data!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Logged Food',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.h),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: loggedFoods.length,
                              itemBuilder: (context, index) {
                                final food = loggedFoods[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 8.0),
                                  child: FoodCard(food: food),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: CustomBottomNavBar(),
            ));
      },
    );
  }
}
