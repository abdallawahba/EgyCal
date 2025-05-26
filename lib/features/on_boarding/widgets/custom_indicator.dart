import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomIndicator extends StatelessWidget {
  final PageController controller;
  final int count;
  const CustomIndicator({
    Key? key,
    required this.controller,
    required this.count,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(controller: controller, count: 3,
      effect: ExpandingDotsEffect(
          activeDotColor: Color(0xFF102A43),
          dotHeight: 8,
          dotWidth: 8,
          expansionFactor: 2,
          radius: 4

      ),
    );
  }
}
