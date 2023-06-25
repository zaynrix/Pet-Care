part of profile_module;

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.p24.paddingBottom,
      margin: AppMargin.m24.marginBottom,
      width: double.infinity,
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
            child: SvgPicture.asset(IconAssets.mastercard),
          ),
          AppSize.s16.addHorizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ace Mastercard" ,style: supTitleMedium,),
              Text("....1994" ,style: footNoteRegular(color: ColorManager.gray),)
            ],
          )
        ],
      ),
    );
  }
}
