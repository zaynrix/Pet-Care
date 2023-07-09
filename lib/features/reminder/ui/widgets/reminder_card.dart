part of reminder_module;

class ReminderCard extends StatelessWidget {
  const ReminderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: .30,
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            foregroundColor: ColorManager.error,
            onPressed: (value){},
            icon: Icons.delete,
            backgroundColor: Colors.transparent,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("09 AM" , style: footNoteRegular(color: ColorManager.gray),),
          AppSize.s22.addHorizontalSpace,
          Container(
            padding: AppPadding.p16.paddingAll,
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: AppSize.s16.circularRadius,
                boxShadow: [customShadow()]
            ),
            child: Column(
              children: [
                Container(
                  padding: AppSize.s7.paddingAll,
                  decoration: const BoxDecoration(
                      border: Border(left: BorderSide(color: ColorManager.secondaryLight ,width: 2))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: Get.width * 0.6,
                          child: const Text("Simparica TrioChewable, 12 mg", style: bodyMedium, maxLines: 2, overflow: TextOverflow.ellipsis,)),
                      AppSize.s4.addVerticalSpace,
                      Text("1 Tablet, per day" , style: footNoteRegular(color: ColorManager.gray),)
                    ],
                  ),
                ),
                AppSize.s16.addVerticalSpace,
                Row(
                  children: [
                    SvgPicture.asset(IconAssets.clock),
                    AppSize.s6.addHorizontalSpace,
                    Text("09:20 AM" , style: footNoteRegular(color: ColorManager.primary),),
                    ( Get.width * 0.7).addHorizontalSpace,
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
