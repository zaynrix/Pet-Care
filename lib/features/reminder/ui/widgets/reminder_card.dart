part of reminder_module;
class ReminderCard extends StatelessWidget {
  const ReminderCard({
    required this.date,
    required this.deleteReminder,
    required this.title,
    required this.createdAt,
    required this.iconPath,
    required this.description,
    required this.colorSide,
    Key? key,
  }) : super(key: key);

  final String createdAt;
  final String date;
  final String title;
  final String iconPath;
  final void Function(BuildContext)? deleteReminder;
  final String description;
  final Color colorSide;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: .30,
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            foregroundColor: ColorManager.error,
            onPressed: deleteReminder,
            icon: Icons.delete,
            backgroundColor: Colors.transparent,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            createdAt,
            style: footNoteRegular(color: ColorManager.gray),
          ),
          AppSize.s22.addHorizontalSpace,
          Container(
            margin: AppSize.s16.marginBottom,
            padding: AppPadding.p16.paddingAll,
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: AppSize.s16.circularRadius,
                boxShadow: [customShadow()]),
            child: Column(
              children: [
                Container(
                  padding: AppSize.s7.paddingAll,
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: colorSide, width: 2))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: Get.width * 0.4,
                          child: Text(
                            title,
                            style: bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                      AppSize.s4.addVerticalSpace,
                      Text(
                        description,
                        style: footNoteRegular(color: ColorManager.gray),
                      )
                    ],
                  ),
                ),
                AppSize.s16.addVerticalSpace,
                Row(
                  children: [
                    SvgPicture.asset(IconAssets.clock),
                    AppSize.s6.addHorizontalSpace,
                    Text(
                      createdAt,
                      style: footNoteRegular(color: ColorManager.primary),
                    ),
                    (Get.width * 0.7).addHorizontalSpace,
                    SvgPicture.asset(IconAssets.notificationSelected)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ReminderCardSub extends StatelessWidget {
  const ReminderCardSub({
    required this.date,
    required this.deleteReminder,
    required this.title,
    required this.createdAt,
    required this.iconPath,
    required this.description,
    Key? key,
  }) : super(key: key);

  final String createdAt;
  final String date;
  final String title;
  final String iconPath;
  final void Function(BuildContext)? deleteReminder;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180.h,
          padding: AppPadding.p16.paddingAll,
          decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: AppSize.s16.circularRadius,
              boxShadow: [customShadow()]),
          child: Column(
            children: [
              Container(
                padding: AppSize.s7.paddingAll,
                decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: ColorManager.secondaryLight, width: 2))),
                child: SizedBox(
                  width: Get.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${title}wwwwwwwwwwwwwdwdw",
                        style: bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${description}wwwwwwwwwwwwwdwdw",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: footNoteRegular(
                          color: ColorManager.gray,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              AppSize.s16.addVerticalSpace,
              Row(
                children: [
                  SvgPicture.asset(IconAssets.clock),
                  AppSize.s6.addHorizontalSpace,
                  Text(
                    createdAt,
                    style: footNoteRegular(color: ColorManager.primary),
                  ),
                  (Get.width * 0.7).addHorizontalSpace,
                  SvgPicture.asset(IconAssets.notificationSelected)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}


