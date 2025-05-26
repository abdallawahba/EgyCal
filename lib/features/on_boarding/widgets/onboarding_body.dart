import 'package:egycal/core/constants.dart';
import 'package:egycal/core/widgets/custom_next_button.dart';
import 'package:egycal/features/on_boarding/widgets/custom_indicator.dart';
import 'package:egycal/features/on_boarding/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OnBoardingviewbody extends StatelessWidget {
  OnBoardingviewbody({super.key});
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: CustomPageview(controller: _controller)),
        Positioned(
            left: 0,
            right: 0,
            top: 572.h,
            child: Center(
                child: CustomIndicator(
                    controller: _controller,
                    count: 3
                )
            )
        ),
        Positioned(
          top: 742.h,
          left: 27.w,
          child: TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/splash'),
              child: Text(
                'Skip',
                style: TextStyle(
                    fontFamily: kInterFont,
                    fontSize: 16,
                    color: kSubTittlesColor,
                    fontWeight: FontWeight.normal
                ),
              )),
        ),
        NextCustomButton(
          pageController: _controller,
          onPressedFun: () {
            if (_controller.positions.isNotEmpty) {
              double currentPage = _controller.page ?? 0;
              if (currentPage < 2) {
                _controller.animateToPage(
                  (currentPage + 1).toInt(),
                  duration: Duration(milliseconds: 750),
                  curve: Curves.easeOutCirc,
                );
              } else {
                Navigator.pushReplacementNamed(context, '/splash');
              }
            }
          },
        ),
      ],
    );
  }
}
