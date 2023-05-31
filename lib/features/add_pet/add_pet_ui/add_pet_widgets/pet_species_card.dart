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
  final bool isSelected ;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: sizeConfig.getScreenWidth(AppSize.s80),
        height: sizeConfig.getScreenHeight(116.74),
        child: Column(
          children: [
            AnimatedContainer(
              curve: Curves.easeInOut,
              margin: const EdgeInsetsDirectional.only(end: AppPadding.p10),

              duration: const Duration(milliseconds: 200),
              padding: isSelected ? const EdgeInsets.all(3) : const EdgeInsets.all(0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.transparent,
                  border: isSelected ? Border.all(
                      color: ColorManager.secondary,
                      width: 2
                  ) : null
              ),
              child: AnimatedContainer(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 200),
                width:  isSelected ? sizeConfig.getScreenWidth(AppSize.s86) : sizeConfig.getScreenWidth(AppSize.s80),
                height: isSelected ? sizeConfig.getScreenHeight(AppSize.s86) : sizeConfig.getScreenHeight(AppSize.s80),
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
              ),),
            ),
            Text(type, style: bodyRegular(color: ColorManager.primary),)
          ],
        ),
      ),
    );
  }
}
