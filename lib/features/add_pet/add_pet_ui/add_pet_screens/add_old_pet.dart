import 'package:flutter/material.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_widgets/gradient_circle_line.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class AppOldPetScreen extends StatelessWidget {
  AppOldPetScreen({Key? key}) : super(key: key);

  final SizeConfig sizeConfig = locator<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s32)),
          Text("How old is your pet?" ,style: h3Bold(color: ColorManager.primary),),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s25)),
          const GradientCircleLine(),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s16)),
          SizedBox(
            height: sizeConfig.getScreenHeight(AppSize.s48),
            child: WheelChooser.integer(
              onValueChanged: (s) {

              },
              maxValue: 99,
              minValue: 1,
              initValue: 2,
              horizontal: true,
              itemSize: 70,
              selectTextStyle: h3Bold(color: ColorManager.primary),
              unSelectTextStyle: h3Bold(color: ColorManager.primary.withOpacity(0.5))
            ),
          ),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s5)),
          Text("years",style: bodyRegular(color: ColorManager.primary)),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s16)),
          const GradientCircleLine(),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s16)),
          SizedBox(
            height: sizeConfig.getScreenHeight(AppSize.s48),
            child: WheelChooser.integer(
              onValueChanged: (s) {},
              maxValue: 12,
              minValue: 1,
              initValue: 8,
              horizontal: true,
              itemSize: 70,
                selectTextStyle: h3Bold(color: ColorManager.primary),
                unSelectTextStyle:h3Bold(color: ColorManager.primary.withOpacity(0.5)),
            ),
          ),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s5)),
          const Text("months",style: TextStyle(fontSize: 15),),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s16)),
          const GradientCircleLine(),
        ],
      ),
    );
  }
}
