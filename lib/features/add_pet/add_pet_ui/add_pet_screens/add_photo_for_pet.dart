import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';

class AddPhotoForPetScreen extends StatelessWidget {
  AddPhotoForPetScreen({Key? key}) : super(key: key);
  final SizeConfig sizeConfig = locator<SizeConfig>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s32)),
            Text("Add a photo of your pet" , style: h3Bold(color: ColorManager.primary),),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s32)),
            Container(
              height: sizeConfig.getScreenHeight(472),
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManager.secondaryLight,
                borderRadius: BorderRadius.circular(AppSize.s25)
              ),
              child: Column(
                children: [
                  SvgPicture.asset(IconAssets.dogType,
                  height: sizeConfig.getScreenHeight(178),
                  width: sizeConfig.getScreenWidth(178),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
