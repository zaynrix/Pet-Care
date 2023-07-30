part of common_widgets;

class SelectionTypeCard extends StatelessWidget {
  SelectionTypeCard({
    Key? key,
    required this.type,
    required this.iconPath,
    required this.backgroundColor,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final SizeConfig sizeConfig = sl<SizeConfig>();
  final String type;
  final String iconPath;
  final Color backgroundColor;
  final bool isSelected;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: AppSize.s12.marginHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              padding: isSelected
                  ? 3.paddingAll
                  : 0.paddingAll,
              curve: Curves.linear,
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: ColorManager.secondary, width: 2)
                      : null),
              child: AnimatedContainer(
                curve: Curves.linear,
                duration: const Duration(milliseconds: 200),
                width: isSelected
                    ? sizeConfig.getScreenWidth(AppSize.s86)
                    : sizeConfig.getScreenWidth(AppSize.s80),
                height: isSelected
                    ? sizeConfig.getScreenHeight(AppSize.s86)
                    : sizeConfig.getScreenHeight(AppSize.s80),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColor,
                ),
                child: Container(
                  padding: AppPadding.p20.paddingAll,
                  child: SvgPicture.asset(
                    iconPath,
                    height: AppSize.s40.height,
                    width: sizeConfig.getScreenWidth(AppSize.s40),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: sizeConfig.getScreenHeight(AppSize.s10),
            ),
            Text(
              type,
              style: bodyRegular(color: ColorManager.primary),
            )
          ],
        ),
      ),
    );
  }
}
