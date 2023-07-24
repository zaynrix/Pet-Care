import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/size_config.dart';
class FirstOnBoardingScreen extends StatelessWidget {
  FirstOnBoardingScreen({Key? key}) : super(key: key);

  final SizeConfig sizeConfig = sl<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    debugPrint("This is inside print");
    return Scaffold(
      body: SizedBox(
        height: sizeConfig.getScreenHeight(450),
        child: Stack(

          children: [
            Positioned(
              bottom: 0,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: SvgPicture.asset(SvgAssets.firstScreenFirstShabe,
                  height: sizeConfig.getScreenHeight(393),
                  width: sizeConfig.getScreenWidth(256),
                ),
              ),
            ),
            Positioned(
              bottom: sizeConfig.getScreenHeight(42.64),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sizeConfig.getScreenHeight(68)),
                child: SvgPicture.asset(SvgAssets.firstScreenPet,
                  // width: sizeConfig.getScreenHeight(232.79),
                  // height: sizeConfig.getScreenWidth(163.61),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: SvgPicture.asset(SvgAssets.firstScreenSecondShabe),
            ),
          ],
        ),
      ),
    );
  }
}
