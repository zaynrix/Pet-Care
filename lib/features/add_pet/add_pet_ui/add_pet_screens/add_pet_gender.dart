import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/common_widgets/customTextFormField.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/utils/validate_extension.dart';

class AddPetGenderScreen extends StatelessWidget {
  AddPetGenderScreen({
    Key? key,
  }) : super(key: key);

  SizeConfig sizeConfig = locator<SizeConfig>();
  TextEditingController petNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeConfig.getScreenWidth(AppSize.s32)),
      child: Column(
        children: [
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s32)),
          Text(
            "What about\n your pet’s breed?",
            textAlign: TextAlign.center,
            style: h3Bold(color: ColorManager.primary),
          ),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s48)),
          SizedBox(
            width: sizeConfig.getScreenWidth(201),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      // padding: isSelected ? const EdgeInsets.all(AppSize.s8) : const EdgeInsets.all(0),
                      width: sizeConfig.getScreenWidth(AppSize.s80),
                      height: sizeConfig.getScreenHeight(AppSize.s80),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.secondaryLight,
                          border: Border.all(
                              color: ColorManager.secondary,
                              width: 2
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
                          IconAssets.male,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      // padding: isSelected ? const EdgeInsets.all(AppSize.s8) : const EdgeInsets.all(0),
                      width: sizeConfig.getScreenWidth(AppSize.s80),
                      height: sizeConfig.getScreenHeight(AppSize.s80),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.secondaryLight,
                          border: Border.all(
                              color: ColorManager.secondary,
                              width: 2
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
                          IconAssets.female,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
