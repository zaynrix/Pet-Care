import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';

class PetSpeciesCard extends StatelessWidget {
  PetSpeciesCard({
    Key? key,
    required this.type,
    required this.iconPath,
    required this.backgroundColor,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final SizeConfig sizeConfig = locator<SizeConfig>();
  final String type;
  final String iconPath;
  final Color backgroundColor;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: sizeConfig.getScreenWidth(AppSize.s15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              padding: isSelected
                  ? const EdgeInsets.all(3)
                  : const EdgeInsets.all(0),
              curve: Curves.linear,
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: ColorManager.secondary, width: 2)
                      : null),
              child: AnimatedContainer(
                curve: Curves.linear,
                duration: const Duration(milliseconds: 200),
                width: isSelected
                    ? sizeConfig.getScreenWidth(AppSize.s86)
                    : sizeConfig.getScreenWidth(AppSize.s80),
                height: isSelected
                    ? sizeConfig.getScreenHeight(AppSize.s86)
                    : sizeConfig.getScreenHeight(AppSize.s80),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColor,
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    iconPath,
                    height: sizeConfig.getScreenHeight(AppSize.s40),
                    width: sizeConfig.getScreenWidth(AppSize.s40),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: sizeConfig.getScreenHeight(AppSize.s10),
            ),
            Text(
              type,
              style: bodyRegular(color: ColorManager.primary),
            )
          ],
        ),
      ),
    );
  }
}
