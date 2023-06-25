part of profile_module;

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    required this.iconPath,
    required this.title,
    required this.iconColor,
    Key? key,
  }) : super(key: key);

  final String title;
  final String iconPath;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSize.s16.paddingBottom,
      margin: AppSize.s16.marginBottom,
      height: AppSize.s60.height,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(
              color: ColorManager.primaryWithTransparent10
          ))
      ),
      child: Row(
        children: [
          Container(
            padding: AppSize.s10.paddingAll,
            height: AppSize.s44.height,
            width: AppSize.s44.width,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor
            ),
            child: SvgPicture.asset(iconPath),
          ),
          AppSize.s16.addHorizontalSpace,
          Text(title, style: bodyRegular(color: ColorManager.primary),)
        ],
      ),
    );
  }
}
