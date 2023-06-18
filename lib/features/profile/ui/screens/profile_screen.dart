import 'package:flutter/material.dart';
import 'package:pet_care/common_widgets/custom_icon_button.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/values_manager.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);

  final SizeConfig sizeConfig = locator<SizeConfig>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soft,
      appBar: AppBar(
        title: const Text("profile"),
        actions: [
          CustomIconButton(iconPath: IconAssets.edit,),
          addHorizontalSpace(sizeConfig.getScreenWidth(AppSize.s20)),],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: sizeConfig.getScreenWidth(AppSize.s20)),
        child: Column(
          children: [
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s30)),
            Container(
              height: sizeConfig.getScreenHeight(AppSize.s180),
              padding: const EdgeInsets.all(AppSize.s24),
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(AppSize.s16),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.gray.withOpacity(0.05),
                    // spreadRadius: 1,
                    blurRadius: 15,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]
              ),
              child: Column(
                children: [

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
