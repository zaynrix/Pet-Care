import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';

class SuccessAddPatScreen extends StatelessWidget {
  SuccessAddPatScreen({Key? key}) : super(key: key);
  SizeConfig sizeConfig = locator<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: sizeConfig.getScreenWidth(AppSize.s48)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s130)),
            SvgPicture.asset(SvgAssets.successAddPet),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s32)),
            const Text(
              "Successfully added!",
              style: h3Bold,
            ),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s10)),
            const Text("Now you can enjoy\n our all services.",
                style: supTitleMedium,
                textAlign: TextAlign.center),
            const Spacer(),
            ElevatedButton(
                onPressed: () {}, child: const Text("Add another Pet")),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s20)),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Go to home page",
                  style: bodyRegular(color: ColorManager.secondary),
                )),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s40)),
          ],
        ),
      ),
    );
  }
}
