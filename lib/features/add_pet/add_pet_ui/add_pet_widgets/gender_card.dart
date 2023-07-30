part of add_pet_widgets;

class GenderCard extends StatelessWidget {
 const GenderCard({
    Key? key,
    required this.onTap,
    required this.isSelected,
    required this.iconPath,
  }) : super(key: key);

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
              ? AppSize.s86.width
              : AppSize.s80.width,
          height: isSelected
              ? AppSize.s86.height
              : AppSize.s80.height,
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
              height: AppSize.s40.height,
              width: AppSize.s40.width,
            ),
          ),
        ),
      ),
    );
  }
}
