import 'package:flutter/material.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';

class DividerShopCard extends StatelessWidget {
   DividerShopCard({
     required this.title,
     required this.onPressed,
     required this.textButton,
    Key? key,
  }) : super(key: key);
  final SizeConfig sizeConfig = locator<SizeConfig>();
  final String title;
  final String textButton;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: sizeConfig.getScreenWidth(AppSize.s24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            title,
            style: titleSemiBoldPrimary,
          ),
          TextButton(
              onPressed: onPressed,
              child: Text(
                textButton,
                style: footNoteRegular(color: ColorManager.gray),
              ))
        ],
      ),
    );
  }
}
