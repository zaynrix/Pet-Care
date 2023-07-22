part of shop_widgets;

class ShodCard extends StatelessWidget {
  ShodCard({
    this.singleProduct,
    this.onTap,
    this.isList = true,
    Key? key,
  }) : super(key: key);
  final SingleProduct? singleProduct;
  final bool isList;
  final SizeConfig sizeConfig = sl<SizeConfig>();
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        start: sizeConfig.getScreenWidth(AppSize.s16),
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
        child: SizedBox(
          height: sizeConfig.getScreenHeight(AppSize.s210),
          width: sizeConfig.getScreenWidth(AppSize.s150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 14, bottom: 10),
                    child: Hero(
                      tag: singleProduct!.id!,
                      child: Image.network(
                        singleProduct!.coverImage!,
                        fit: BoxFit.fitWidth,
                        height: 120,
                        width: 120.w,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10.5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDFD4FB),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Text(
                        "%${singleProduct!.discountPercentage} OFF ",
                        style: const TextStyle(
                          color: ColorManager.primary,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // const RVerticalSpace(height: AppSize.s10),
              Padding(
                padding: 10.paddingHorizontal,
                child: Text(
                  "${singleProduct!.name}",
                  style: footNoteRegular(color: ColorManager.primary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              ),
              AppSize.s10.addVerticalSpace,
              Padding(
                padding: 10.paddingHorizontal,
                child: Row(
                  children: [
                    Text(
                      "\$${singleProduct!.price}",
                      style: footNoteBold,
                    ),
                    const RHorizontalSpace(width: AppSize.s5),
                    Text(
                      "\$${singleProduct!.originalPrice}",
                      style: oldPriceStyle,
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: onTap,
                        child: Icon(
                          singleProduct!.inCart == true
                              ? Icons.add_circle
                              : Icons.remove_circle_outline_rounded,
                          color: ColorManager.secondary,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShodCardGrid extends StatelessWidget {
  ShodCardGrid({
    this.singleProduct,
    this.onTap,
    Key? key,
  }) : super(key: key);
  final SingleProduct? singleProduct;
  final SizeConfig sizeConfig = sl<SizeConfig>();
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 12.paddingHorizontal,
      child: Container(
        height: 600.h,
        decoration: BoxDecoration(
          boxShadow: [customShadow()],
        ),
        child: Card(
          elevation: 0,
          color: ColorManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 14, bottom: 10),
                    child: Hero(
                      tag: singleProduct!.id!,
                      child: Image.network(
                        singleProduct!.coverImage!,
                        fit: BoxFit.fitWidth,
                        height: 120,
                        width: 120.w,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10.5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDFD4FB),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Text(
                        "%${singleProduct!.discountPercentage} OFF ",
                        style: const TextStyle(
                          color: ColorManager.primary,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // const RVerticalSpace(height: AppSize.s10),
              Padding(
                padding: 10.paddingHorizontal,
                child: Text(
                  "${singleProduct!.name}",
                  style: footNoteRegular(color: ColorManager.primary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: 10.paddingHorizontal,
                child: Row(
                  children: [
                    Text(
                      "\$${singleProduct!.price}",
                      style: footNoteBold,
                    ),
                    const RHorizontalSpace(width: AppSize.s5),
                    Text(
                      "\$${singleProduct!.originalPrice}",
                      style: oldPriceStyle,
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: onTap,
                        child: Icon(
                          singleProduct!.inCart == true
                              ? Icons.add_circle
                              : Icons.remove_circle_outline_rounded,
                          color: ColorManager.secondary,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
          .animate(delay: 200.ms)
          .moveY(begin: -100)
          .then()
          .shakeY(hz: 4, amount: 3),
    );
  }
}
