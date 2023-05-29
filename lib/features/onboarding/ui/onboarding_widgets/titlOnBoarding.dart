import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_care/features/onboarding/model/onBoardingModel.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';

class TitleOnBoarding extends StatelessWidget {
  const TitleOnBoarding({
    Key? key,
    required this.list,
    required int activeIndex,
  }) :
        _activeIndex = activeIndex,
        super(key: key);

  final List<OnBoardingModel> list;
  final int _activeIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 288.w,
      child: Text(
        list[_activeIndex].title,
        style: h3Bold(color: ColorManager.primary),
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
