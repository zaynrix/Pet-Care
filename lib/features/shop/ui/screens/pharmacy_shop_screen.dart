import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/features/shop/core/shop_controller/shop_controller.dart';
import 'package:pet_care/features/shop/ui/widgets/banner_card.dart';
import 'package:pet_care/features/shop/ui/widgets/divider_shop_card.dart';
import 'package:pet_care/features/shop/ui/widgets/shop_card.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/values_manager.dart';

class PharmacyShopScreen extends StatefulWidget {
  const PharmacyShopScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyShopScreen> createState() => _PharmacyShopScreenState();
}

class _PharmacyShopScreenState extends State<PharmacyShopScreen> {
  final shopController = Get.put(ShopController());
  final SizeConfig sizeConfig = locator<SizeConfig>();

  @override
  void initState() {
    super.initState();
    shopController.initPharmacyShopState();
  }

  @override
  void dispose() {
    super.dispose();
    shopController.disposePharmacyState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soft,
      body: Column(
        children: [
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s25)),
          BannerCard(
            controller: shopController.bannerCardController,
            onTap: (int index) => shopController.updateCurrantBannerCard(index),
            listSvg: SvgAssets.banners,
          ),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s32)),
          DividerShopCard(
            title: 'Best Seller',
            textButton: "See all",
            onPressed: () {},
          ),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s16)),
          SizedBox(
            height: sizeConfig.getScreenHeight(AppSize.s220),
              child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ShodCard())),
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s32)),
          DividerShopCard(
            title: 'Top brands',
            textButton: "See all",
            onPressed: () {},
          ),
          Image.asset(ImageAssets.bannerImage),
        ],
      ),
    );
  }
}
