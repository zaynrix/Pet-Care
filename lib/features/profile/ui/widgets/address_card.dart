part of profile_module;

class AddressCard extends StatelessWidget {
  const AddressCard({
    required this.iconPath,
    required this.title,
    required this.color,
    required this.addressDetails,
    Key? key,
    required this.deleteFunction,
  }) : super(key: key);

  final Function(BuildContext p1)? deleteFunction;
  final String title;
  final String addressDetails;
  final String iconPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          extentRatio: .30,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              foregroundColor: ColorManager.error,
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.white,
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: ColorManager.primaryWithTransparent10))),
          padding: AppPadding.p18.paddingBottom,
          margin: AppSize.s24.marginBottom,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // height: AppSize.s36.height,
                width: AppSize.s100.width,
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.width, vertical: AppSize.s6.height),
                decoration: BoxDecoration(
                    color: color, borderRadius: AppSize.s10.circularRadius),
                child: Row(
                  children: [
                    SvgPicture.asset(iconPath),
                    AppSize.s8.addHorizontalSpace,
                    Text(
                      title,
                      style: bodyMedium,
                    )
                  ],
                ),
              ),
              AppSize.s10.addVerticalSpace,
              SizedBox(
                width: double.infinity,
                child: Text(
                  addressDetails,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: bodyRegular(color: ColorManager.primary),
                ),
              ),
            ],
          ),
        ));
  }
}
