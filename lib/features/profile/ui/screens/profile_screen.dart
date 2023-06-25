part of profile_module;

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final SizeConfig sizeConfig = sl<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soft,
      appBar: AppBar(
        title: const Text(AppStrings.profile),
        actions: [
          CustomIconButton(
            iconPath: IconAssets.edit,
          ),
          const RHorizontalSpace(width: AppSize.s30),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: sizeConfig.getScreenWidth(AppSize.s20)),
        child: Column(
          children: [
            const RVerticalSpace(height: AppSize.s30),
            Container(
              width: double.infinity,
              padding: AppSize.s24.paddingAll,
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: AppSize.s16.circularRadius,
                  boxShadow: [customShadow()]),
              child: Column(
                children: [
                  ProfileTile(
                    iconPath: IconAssets.unSelectedProfile,
                    title: "Ace Ventura",
                    iconColor: ColorManager.primaryWithTransparent10,
                  ),
                  Row(
                    children: [
                      AppSize.s20.addHorizontalSpace,
                      SvgPicture.asset(IconAssets.email),
                      AppSize.s24.addHorizontalSpace,
                      Text(
                        "acevent@mail.com",
                        style: bodyRegular(color: ColorManager.primary),
                      )
                    ],
                  ),
                  AppSize.s16.addVerticalSpace,
                  Row(
                    children: [
                      AppSize.s20.addHorizontalSpace,
                      SvgPicture.asset(IconAssets.mobile),
                      AppSize.s24.addHorizontalSpace,
                      Text(
                        "434-1234567",
                        style: bodyRegular(color: ColorManager.primary),
                      )
                    ],
                  ),
                ],
              ),
            ),
            AppSize.s24.addVerticalSpace,
            Container(
              padding: AppSize.s24.paddingAll,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: AppSize.s16.circularRadius,
                  boxShadow: [customShadow()]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileTile(
                    iconPath: IconAssets.unSelectedProfile,
                    title: AppStrings.paymentMethod,
                    iconColor: ColorManager.secondaryLight,
                  ),
                  const ProfileTile(
                    iconPath: IconAssets.unSelectedProfile,
                    title: AppStrings.addresses,
                    iconColor: ColorManager.tertiary,
                  ),
                  const ProfileTile(
                    iconPath: IconAssets.unSelectedProfile,
                    title: AppStrings.orders,
                    iconColor: ColorManager.quaternary,
                  ),
                  const ProfileTile(
                    iconPath: IconAssets.unSelectedProfile,
                    title: AppStrings.apointments,
                    iconColor: ColorManager.greenLight,
                  ),
                  AppSize.s16.addVerticalSpace,
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.logOut,
                        style: bodyRegular(color: ColorManager.error),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
