part of add_pet_widgets;

class GenderCard extends StatelessWidget {
  GenderCard({
    Key? key,
    required this.onTap,
    required this.isSelected,
    required this.iconPath,
  }) : super(key: key);

  final SizeConfig sizeConfig = locator<SizeConfig>();
  final bool isSelected;
  final void Function()? onTap;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        padding: isSelected ? const EdgeInsets.all(3) : const EdgeInsets.all(0),
        margin: const EdgeInsetsDirectional.only(end: AppPadding.p16),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.transparent,
            border: isSelected
                ? Border.all(color: ColorManager.secondary, width: 2)
                : Border.all(color: const Color(0xFFC4C4C4), width: 1)),
        // color: ColorManager.transparent,
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
          // padding: isSelected ? const EdgeInsets.all(AppSize.s8) : const EdgeInsets.all(0),
          width: isSelected
              ? sizeConfig.getScreenWidth(AppSize.s86)
              : sizeConfig.getScreenWidth(AppSize.s80),
          height: isSelected
              ? sizeConfig.getScreenWidth(AppSize.s86)
              : sizeConfig.getScreenWidth(AppSize.s80),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected
                ? ColorManager.secondaryLight
                : ColorManager.transparent,
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              iconPath,
              height: sizeConfig.getScreenHeight(AppSize.s40),
              width: sizeConfig.getScreenWidth(AppSize.s40),
            ),
          ),
        ),
      ),
    );
  }
}
