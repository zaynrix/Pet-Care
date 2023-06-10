import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/features/auth/auth_ui/screens/login_screen.dart';
import 'package:pet_care/features/auth/auth_ui/screens/sign_up_screen.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';

class MainShopScreen extends StatelessWidget {
  MainShopScreen({Key? key}) : super(key: key);

  final SizeConfig sizeConfig = locator<SizeConfig>();


  @override
  Widget build(BuildContext context) {
    return

      DefaultTabController(
        length: 4,
        child: Scaffold(
        backgroundColor: ColorManager.soft,
        appBar: AppBar(
          title: const Text("Pet Shop"),
          leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back),),
          actions: [
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(AppSize.s10),
                height: sizeConfig.getScreenHeight(AppSize.s44),
                width: sizeConfig.getScreenWidth(AppSize.s44),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorManager.primaryWithTransparent30  , width: 1)
                ),
                child: SvgPicture.asset(IconAssets.unSelectedCart),
              ),
            ),
            addHorizontalSpace(sizeConfig.getScreenWidth(AppSize.s20)),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(sizeConfig.getScreenHeight(AppSize.s40)),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorManager.primaryWithTransparent10,
                    width: 1
                  )
                )
              ),
              child: TabBar(
                      onTap: (index) {},
                    unselectedLabelColor: ColorManager.primary,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: ColorManager.secondary, width: 2),
                        ),
                        color: ColorManager.transparent),
                    tabs: [
                      Tab(
                        child: Text(
                          "Pharmacy ",
                          maxLines: 1,
                          style: bodyRegular(color: ColorManager.gray),
                        ),
                      ),
                      Tab(
                        child: Text("Pet food",
                            maxLines: 1,
                          style: bodyRegular(color: ColorManager.gray),
                            ),
                      ),
                      Tab(
                        child: Text("Accessorise",
                            maxLines: 1,
                          style: bodyRegular(color: ColorManager.gray),
                            ),
                      ),
                      Tab(
                        child: Text("Furniture",
                            maxLines: 1,
                          style: bodyRegular(color: ColorManager.gray),
                            ),
                      ),
                    ]),
            ),
          ),
          ),
        body: TabBarView(

          // physics: const NeverScrollableScrollPhysics(),
          children: [
            LoginScreen(),
            SignUpScreen(),
            SignUpScreen(),
            LoginScreen(),
          ],
        ),
        ),
      );

  }
}
