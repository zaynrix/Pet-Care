part of profile_module;

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    required this.iconPath,
    required this.supTitle,
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;
  final String supTitle;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.p24.paddingBottom,
      margin: AppMargin.m24.marginBottom,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: ColorManager.primaryWithTransparent10))
      ),
      child: Row(
        children: [
            Container(
              padding: AppPadding.p8.paddingAll,
              height: AppSize.s40.height,
              width: AppSize.s40.width,
              decoration: BoxDecoration(
                  color: ColorManager.secondaryWithTransparent50,
                  shape: BoxShape.rectangle,
                  borderRadius: AppSize.s10.circularRadius
              ),
              child: SvgPicture.asset(iconPath),
            ),
          AppSize.s16.addHorizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title ,style: supTitleMedium,),
              Text(supTitle ,style: footNoteRegular(color: ColorManager.gray),)
            ],
          )
        ],
      ),
    );
  }
}
