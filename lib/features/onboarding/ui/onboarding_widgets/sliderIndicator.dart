import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
class SliderIndicator extends StatelessWidget {
  const SliderIndicator({
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
      height: AppSize.s9.h,
      width: currantPage == activeIndex ? AppSize.s35.w : AppSize.s9.w,
      decoration: BoxDecoration(
        color: currantPage == activeIndex ? ColorManager.secondaryLight : ColorManager.gray,
        borderRadius: BorderRadius.circular(AppSize.s24),
      ),
    );

  }
}