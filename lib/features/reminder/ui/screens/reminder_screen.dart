part of reminder_module;

class ReminderScreen extends StatelessWidget {
  ReminderScreen({Key? key}) : super(key: key);

  DateTime selectedDate = DateTime.now();
  final reminderController = Get.put(ReminderController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text("Reminder"),
            Text(
              "Today ${DateTime.now().toString().convertToFullDate()!}",
              style: captionRegular,
            ),
          ],
        ),
        actions: [
          CustomIconButton(
              onTap: () {
                RouteService.serviceNavi
                    .pushNamedWidget(RouteGenerator.addReminderScreen);
              },
              iconPath: IconAssets.plus),
          AppSize.s40.addHorizontalSpace
        ],
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ReminderController>(
          builder: (GetxController controller) => Padding(
            padding: AppSize.s24.paddingAll,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(end: AppSize.s14.width),
                  child: DatePicker(
                    initialSelectedDate: DateTime.now(),
                    DateTime.now(),
                    height: AppSize.s110.height,
                    width: AppSize.s50.width,
                    onDateChange: (date) {
                      selectedDate = date;
                    },
                    selectionColor: ColorManager.secondary,
                    dayTextStyle: footNoteRegular(color: ColorManager.gray),
                    dateTextStyle:
                        supTitleBold.copyWith(color: ColorManager.gray),
                    monthTextStyle: footNoteRegular(color: ColorManager.gray),
                  ),
                ),
                AppSize.s40.addVerticalSpace,
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: reminderController.reminderBox?.length ?? 0,
                    itemBuilder: (context, index) {
                      final reminder = reminderController.reminderBox!
                          .getAt(index) as ReminderModel;
                      return ReminderCard(
                        deleteReminder: (context) {
                          reminderController.deleteReminder(index);
                        },
                        iconPath: reminder.isDone == false
                            ? IconAssets.notificationSelected
                            : IconAssets.unSelectedNotification,
                        date: reminder.createdAtDate
                            .toString()
                            .convertToFullDate()!,
                        title: reminder.title,
                        createdAt:
                            reminder.createdAtTime.toString().convertToTime()!,
                        description: reminder.description,
                      );
                    }),
                // const ReminderCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
