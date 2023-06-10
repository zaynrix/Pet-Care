import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/values_manager.dart';

class SecondOnBoardingScreen extends StatefulWidget {
  const SecondOnBoardingScreen({Key? key}) : super(key: key);

  @override
  SecondOnBoardingScreenState createState() => SecondOnBoardingScreenState();
}

class SecondOnBoardingScreenState extends State<SecondOnBoardingScreen>
    with TickerProviderStateMixin {
  final SizeConfig sizeConfig = locator<SizeConfig>();
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: sizeConfig.getScreenHeight(450),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -1),
                  end: Offset.zero,
                ).animate(animationController),
                child: SvgPicture.asset(
                  SvgAssets.secondScreenFirstShape,
                  height: sizeConfig.getScreenHeight(AppSize.s112),
                  width: sizeConfig.getScreenWidth(225),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ScaleTransition(
                scale: Tween<double>(
                  begin: 0,
                  end: 1,
                ).animate(animationController),
                child: Container(
                  height: sizeConfig.getScreenHeight(393),
                  decoration: const BoxDecoration(
                    color: ColorManager.secondaryLight,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: sizeConfig.getScreenHeight(AppSize.s22),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sizeConfig.getScreenWidth(AppSize.s120),
                ),
                child: FadeTransition(
                  opacity: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(animationController),
                  child: SvgPicture.asset(SvgAssets.secondScreenPet),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}