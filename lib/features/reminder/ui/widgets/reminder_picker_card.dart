part of reminder_module;

class ReminderPickerCard extends StatelessWidget {
   ReminderPickerCard({
     required this.sheetPage,
    Key? key,
  }) : super(key: key);

  Widget Function(BuildContext) sheetPage;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23.r),
              topRight: Radius.circular(23.r)),
        ),
        context: context,
        builder: sheetPage,),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppSize.s24.width, vertical: AppSize.s9.height),
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: AppSize.s16.circularRadius,
            boxShadow: [customShadow()]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Time",
                  style: captionRegular,
                ),
                Text(
                  "00:00 AM",
                  style: bodyMedium,
                )
              ],
            ),
            const Icon(Icons.arrow_forward_ios , color: ColorManager.primary, size: AppSize.s20,)
          ],
        ),
      ),
    );
  }
}
