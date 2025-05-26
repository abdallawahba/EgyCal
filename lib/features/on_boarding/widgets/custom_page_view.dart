import 'package:egycal/features/on_boarding/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class CustomPageview extends StatelessWidget {
  final PageController controller;
  CustomPageview({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: PageView(
            controller: controller,
            children: [
              PageViewitem(
                image: 'assets/images/illustrations_1.svg',
                tittle: 'Welcome!',
                subtittle:
                '  Congratulations on taking the \nfirst step toward a healthier you!',
              ),
              PageViewitem(
                image: 'assets/images/illustrations_2.svg',
                tittle: 'Effortless Tracking',
                subtittle:
                ' Easily log your meals, snacks \n         and water intake',
              ),
              PageViewitem(
                image: 'assets/images/illustrations_3.svg',
                tittle: 'Goal Setting',
                subtittle:
                'Set realistic goals and watch \n        your progress unfold',
              )
            ],
          ),
        ),
      ],
    );
  }
}
