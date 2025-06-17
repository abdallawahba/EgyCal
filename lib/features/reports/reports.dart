import 'package:egycal/core/widgets/bottom_nav_bar.dart';
import 'package:egycal/features/reports/widgets/cal_reports_body.dart';
import 'package:flutter/material.dart';


class ReportsPage extends StatelessWidget{
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CaloriesReportBody(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}