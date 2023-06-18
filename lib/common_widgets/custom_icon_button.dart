import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/locator.dart';

import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/values_manager.dart';

class CustomIconButton extends StatelessWidget {
  final SizeConfig sizeConfig = locator<SizeConfig>();

  CustomIconButton({
    required this.iconPath,
    Key? key,
  }) : super(key: key);

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ColorManager.primaryWithTransparent30)),
      height: sizeConfig.getScreenHeight(AppSize.s44),
      width: sizeConfig.getScreenWidth(AppSize.s44),
      padding: const EdgeInsets.all(AppSize.s7),
      child: SvgPicture.asset(iconPath),
    );
  }
}
