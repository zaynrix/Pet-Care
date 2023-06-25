part of profile_module;

class ChoosePaymentMethodCard extends StatelessWidget {
  const ChoosePaymentMethodCard({
    Key? key,
    required this.currentMethod,
    required this.iconPath,
    required this.methodType,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  final String currentMethod;
  final String methodType;
  final String iconPath;
  final String value;
  final void Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
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
         Text(methodType , style: supTitleMedium,),
        const Spacer(),
        Radio(
            activeColor: ColorManager.primary,
            value: value, groupValue: currentMethod, onChanged: onChange)
      ],
    );
  }
}