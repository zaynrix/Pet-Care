import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
import 'package:pet_care/features/onboarding/model/onBoardingModel.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    required this.activeIndex,
    required this.currantPage,
  }) :  super(key: key);

  final int activeIndex;
  final int currantPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currantPage == activeIndex ? 20 : 6,
      decoration: BoxDecoration(
        color: currantPage == activeIndex ? ColorManager.secondaryLight : ColorManager.gray,
        borderRadius: BorderRadius.circular(3),
      ),
    );

    //   SliderIndicator(
    //   length: list.length,
    //   activeIndex: _activeIndex,
    //   activeIndicator: Container(
    //     height: AppSize.s9.h,
    //     width: AppSize.s35.w,
    //     decoration: const BoxDecoration(
    //       color: ColorManager.secondaryLight,
    //       borderRadius: BorderRadius.all(Radius.circular(23.11))
    //     ),
    //   ),
    //   indicator: const Icon(
    //     Icons.fiber_manual_record,
    //     color: ColorManager.gray,
    //     size: AppSize.s12,
    //   ),
    // );
  }
}