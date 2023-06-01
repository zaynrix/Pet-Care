import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';

class IsPetNeuterWidget extends StatelessWidget {
  IsPetNeuterWidget({
    Key? key,
    required this.onTap,
    required this.isSelected,
    required this.title,
  }) : super(key: key);

  final SizeConfig sizeConfig = locator<SizeConfig>();
  final bool isSelected;
  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        padding: isSelected ? const EdgeInsets.all(3) : const EdgeInsets.all(0),
        margin: const EdgeInsetsDirectional.only(end: AppPadding.p16),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.transparent,
            border: isSelected ? Border.all(
                color: ColorManager.secondary,
                width: 2
            ) :  Border.all(
                color: const Color(0xFFC4C4C4),
                width: 1
            )
        ),
        // color: ColorManager.transparent,
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
          width: isSelected ? sizeConfig.getScreenWidth(AppSize.s86) : sizeConfig.getScreenWidth(AppSize.s80),
          height: isSelected ? sizeConfig.getScreenWidth(AppSize.s86) : sizeConfig.getScreenWidth(AppSize.s80),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? ColorManager.secondaryLight : ColorManager.transparent,
          ),
          child: Center(child: Text(title ,style: bodyRegular(color: ColorManager.primary),)),
        ),
      ),
    );
  }
}
