part of shop_screens;

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key}) : super(key: key);

  final SizeConfig sizeConfig = locator<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soft,
      appBar: AppBar(
        title: const Text("Details"),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(AppSize.s10),
              height: sizeConfig.getScreenHeight(AppSize.s44),
              width: sizeConfig.getScreenWidth(AppSize.s44),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: ColorManager.primaryWithTransparent30, width: 1)),
              child: SvgPicture.asset(IconAssets.unSelectedCart),
            ),
          ),
          const RHorizontalSpace(width: AppSize.s20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: sizeConfig.getScreenWidth(AppSize.s24)),
              height: sizeConfig.getScreenHeight(AppSize.s300),
              width: double.infinity,
              decoration: const BoxDecoration(color: ColorManager.soft),
              child: Stack(
                children: [
                  Center(child: Image.asset(ImageAssets.productDetails)),
                  PositionedDirectional(
                    top: sizeConfig.getScreenHeight(AppSize.s80),
                    end: 0,
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Column(
                        children: [
                          CustomIconButton(iconPath: IconAssets.plus),
                          const Text(
                            "1",
                            style: titleBold,
                          ),
                          CustomIconButton(iconPath: IconAssets.plus),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: sizeConfig.getScreenWidth(AppSize.s24)),
              width: double.infinity,
              height: Get.height * 0.5,
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Pro-Sense Itch & Allergy Solutions",
                          style: supTitleBold,
                          maxLines: 2,
                        ),
                      ),
                      const Spacer(),
                      CustomIconButton(iconPath: IconAssets.likeUnselected)
                    ],
                  ),
                  const RVerticalSpace(height: AppSize.s10),
                  const Text(
                    "Choose the pharmacy",
                    style: captionRegular,
                  ),
                  Container(
                    width: double.infinity,
                    height: sizeConfig.getScreenHeight(AppSize.s60),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s8),
                        border: Border.all(
                            color: ColorManager.primaryWithTransparent30)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
