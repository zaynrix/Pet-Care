import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_care/features/onboarding/model/onBoardingModel.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';

class DescriptionOnBoarding extends StatelessWidget {
  const DescriptionOnBoarding({
    Key? key,
    required this.list,
    required int activeIndex,
  }) : _activeIndex = activeIndex, super(key: key);

  final List<OnBoardingModel> list;
  final int _activeIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: AppPadding.p32),
      child: SizedBox(
        height: 72,
        child: Text(
          list[_activeIndex].desc,
          style: supTitleMedium(color: ColorManager.primary),
          textAlign: TextAlign.center,
        ),
        // textAlign: TextAlign.center,
      ),
    );
  }
}
