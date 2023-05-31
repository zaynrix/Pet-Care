import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/values_manager.dart';

class GenderCard extends StatelessWidget {
  GenderCard({
    Key? key,
    required this.onTap,
    required this.isSelected,
    required this.iconPath,
  }) : super(key: key);

 final SizeConfig sizeConfig = locator<SizeConfig>();
  final bool isSelected;
  final void Function()? onTap;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: isSelected ? const EdgeInsets.all(AppSize.s8) : const EdgeInsets.all(0),
        margin: const EdgeInsetsDirectional.only(end: AppPadding.p16),
        color: ColorManager.transparent,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              // padding: isSelected ? const EdgeInsets.all(AppSize.s8) : const EdgeInsets.all(0),
              width: isSelected ? sizeConfig.getScreenWidth(AppSize.s86) : sizeConfig.getScreenWidth(AppSize.s80),
              height: isSelected ? sizeConfig.getScreenWidth(AppSize.s86) : sizeConfig.getScreenWidth(AppSize.s80),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? ColorManager.secondaryLight : ColorManager.transparent,
                  border: isSelected ? Border.all(
                      color: ColorManager.secondary,
                      width: 2
                  ) :  Border.all(
                      color: const Color(0xFFC4C4C4),
                      width: 1
                  )
              ),
            ),
            Positioned(
              top: sizeConfig.getScreenHeight(AppSize.s20),
              left: sizeConfig.getScreenWidth(AppSize.s20),
              child: SizedBox(
                height: sizeConfig.getScreenHeight(AppSize.s40),
                width: sizeConfig.getScreenWidth(AppSize.s40),
                child: SvgPicture.asset(
                  iconPath,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
