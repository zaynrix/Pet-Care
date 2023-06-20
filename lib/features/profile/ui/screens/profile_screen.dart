import 'package:flutter/material.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
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
          const RHorizontalSpace(width: AppSize.s20),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: sizeConfig.getScreenWidth(AppSize.s20)),
        child: Column(
          children: [
            const RVerticalSpace(height: AppSize.s30),
            Container(
              height: sizeConfig.getScreenHeight(AppSize.s180),
              padding: const EdgeInsets.all(AppSize.s24),
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(AppSize.s16),
                boxShadow: [
                  customShadow()
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
