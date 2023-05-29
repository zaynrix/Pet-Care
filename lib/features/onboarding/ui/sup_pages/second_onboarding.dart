import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/values_manager.dart';

class SecondOnBoardingScreen extends StatelessWidget {
  SecondOnBoardingScreen({Key? key}) : super(key: key);

  final SizeConfig sizeConfig = locator<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    debugPrint("This is inside print");
    return Scaffold(
      body: SizedBox(
        height: sizeConfig.getScreenHeight(450),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: SvgPicture.asset(
                SvgAssets.secondScreenFirstShape,
                height: sizeConfig.getScreenHeight(AppSize.s112),
                width: sizeConfig.getScreenWidth(225),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: sizeConfig.getScreenHeight(393),
                decoration: const BoxDecoration(
                  color: ColorManager.secondaryLight,
                  shape: BoxShape.circle
                ),
              )
              // SvgPicture.asset(
              //   SvgAssets.secondScreenSecondShape,
              //   // height: sizeConfig.getScreenHeight(393),
              //   // width: sizeConfig.getScreenWidth(393),
              //   fit: BoxFit.contain,
              // ),
            ),
            Positioned(
              bottom: sizeConfig.getScreenHeight(AppSize.s22),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: sizeConfig.getScreenWidth(AppSize.s120)),
                child: SvgPicture.asset(SvgAssets.secondScreenPet),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
