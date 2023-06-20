part of shop_screens;

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
          const RVerticalSpace(height: AppSize.s25),
          BannerCard(
            controller: shopController.bannerCardController,
            onTap: (int index) => shopController.updateCurrantBannerCard(index),
            listSvg: SvgAssets.banners,
          ),
          const RVerticalSpace(height: AppSize.s32),
          DividerShopCard(
            title: 'Best Seller',
            textButton: "See all",
            onPressed: () {},
          ),
          const RVerticalSpace(height: AppSize.s16),
          SizedBox(
            height: sizeConfig.getScreenHeight(AppSize.s220),
              child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ShodCard())),
          const RVerticalSpace(height: AppSize.s32),
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
