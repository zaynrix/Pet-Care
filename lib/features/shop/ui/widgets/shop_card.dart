part of shop_widgets;

class ShodCard extends StatelessWidget {
   ShodCard({
    Key? key,
  }) : super(key: key);

  final SizeConfig sizeConfig = sl<SizeConfig>();


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: sizeConfig.getScreenWidth(AppSize.s18)),
      decoration: BoxDecoration(
        boxShadow: [
          customShadow()
        ],
      ),
      child: Card(
        elevation: 0,
        color: ColorManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), //<-- SEE HERE
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: sizeConfig.getScreenWidth(AppSize.s10),
              vertical: sizeConfig.getScreenHeight(AppSize.s14)),
          height: sizeConfig.getScreenHeight(AppSize.s213),
          width: sizeConfig.getScreenWidth(AppSize.s150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.dogMedicine),
              const RVerticalSpace(height: AppSize.s10),
              Text(
                "Pro-Sense Itch & Allergy Solutions",
                style: footNoteRegular(color: ColorManager.primary),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              const RVerticalSpace(height: AppSize.s10),
              Row(
                children: [
                  const Text(
                    "\$14.36",
                    style: footNoteBold,
                  ),
                  const RHorizontalSpace(width: AppSize.s5),
                  const  Text(
                    "\$16.90",
                    style: oldPriceStyle,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      width: sizeConfig.getScreenWidth(AppSize.s25),
                      height: sizeConfig.getScreenHeight(AppSize.s25),
                      padding: const EdgeInsets.all(AppSize.s6),
                      decoration: const BoxDecoration(
                        color: ColorManager.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(IconAssets.plus ,color: ColorManager.white,),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
