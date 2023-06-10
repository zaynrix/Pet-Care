import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/values_manager.dart';

class BannerCard extends StatelessWidget {
  BannerCard({
    required this.listSvg,
    required this.controller,
    required this.onTap, Key? key}) : super(key: key);

 final List listSvg;
  PageController controller;
  Function(int x) onTap;
  final SizeConfig sizeConfig = locator<SizeConfig>();


  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        // margin: EdgeInsetsDirectional.only(start: sizeConfig.getScreenWidth(AppSize.s24)),
        height: sizeConfig.getScreenWidth(AppSize.s85),
        width: double.infinity,
        child: PageView.builder(
          onPageChanged: onTap,
          controller: controller,
          itemCount: listSvg.length,
          itemBuilder: (context, index) {
            return SvgPicture.asset(
                 listSvg[index]);
          },
        ),
      );

  }
}
