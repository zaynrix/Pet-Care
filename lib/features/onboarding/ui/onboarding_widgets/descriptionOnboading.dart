import 'package:flutter/material.dart';
import 'package:pet_care/features/onboarding/model/onBoardingModel.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';

class DescriptionOnBoarding extends StatelessWidget {
  DescriptionOnBoarding({
    Key? key,
    required this.list,
    required int activeIndex,
  }) : _activeIndex = activeIndex, super(key: key);

  final List<OnBoardingModel> list;
  final int _activeIndex;
  final SizeConfig sizeConfig = locator<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: sizeConfig.getScreenWidth(AppPadding.p32)),
      child: SizedBox(
        height: sizeConfig.getScreenHeight(72),
        child: Text(
          list[_activeIndex].desc,
          style: supTitleMedium,
          textAlign: TextAlign.center,
        ),
        // textAlign: TextAlign.center,
      ),
    );
  }
}
