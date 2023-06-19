part of common_widgets;

class CustomIconButton extends StatelessWidget {
  final SizeConfig sizeConfig = locator<SizeConfig>();

  CustomIconButton({
    required this.iconPath,
    Key? key,
  }) : super(key: key);

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ColorManager.primaryWithTransparent30)),
      height: sizeConfig.getScreenHeight(AppSize.s44),
      width: sizeConfig.getScreenWidth(AppSize.s44),
      padding: const EdgeInsets.all(AppSize.s7),
      child: SvgPicture.asset(iconPath),
    );
  }
}
