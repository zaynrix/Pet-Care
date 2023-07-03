part of shop_widgets;

class ShodCard extends StatelessWidget {
  ShodCard({
    Key? key,
  }) : super(key: key);

  final SizeConfig sizeConfig = sl<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        start: sizeConfig.getScreenWidth(AppSize.s18),
      ),
      decoration: BoxDecoration(
        boxShadow: [customShadow()],
      ),
      child: Card(
        elevation: 0,
        color: ColorManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: sizeConfig.getScreenWidth(AppSize.s10),
            vertical: sizeConfig.getScreenHeight(AppSize.s14),
          ),
          // height: sizeConfig.getScreenHeight(AppSize.s213),
          width: sizeConfig.getScreenWidth(AppSize.s150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(ImageAssets.dogMedicine),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6.0,
                        vertical: 2.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDFD4FB),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text(
                        "%15 OFF",
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              RVerticalSpace(height: AppSize.s10.sp),
              Flexible(
                child: Text(
                  "Pro-Sense Itch & Allergy SolutionsllergySolutionsllergySolutionsllergy Solutions",
                  style: footNoteRegular(color: ColorManager.primary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  const Text(
                    "\$14.36",
                    style: footNoteBold,
                  ),
                  const RHorizontalSpace(width: AppSize.s5),
                  const Text(
                    "\$16.90",
                    style: oldPriceStyle,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: sizeConfig.getScreenWidth(AppSize.s25),
                      height: sizeConfig.getScreenHeight(AppSize.s25),
                      padding: const EdgeInsets.all(AppSize.s6),
                      decoration: const BoxDecoration(
                        color: ColorManager.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        IconAssets.plus,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
