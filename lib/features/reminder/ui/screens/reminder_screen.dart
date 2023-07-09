part of reminder_module;

class ReminderScreen extends StatelessWidget {
  ReminderScreen({Key? key}) : super(key: key);

  DateTime selectedDate = DateTime.now();
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
          CustomIconButton(onTap: () {}, iconPath: IconAssets.plus),
          AppSize.s40.addHorizontalSpace
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSize.s24.paddingAll,
          child: Column(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(end: AppSize.s14.width),
                child: DatePicker(
                  initialSelectedDate: DateTime.now(),
                  DateTime.now(),
                  height: AppSize.s85.height,
                  width: AppSize.s50.width,
                  onDateChange: (date){
                    selectedDate = date;
                  },
                  selectionColor: ColorManager.secondary,
                  dayTextStyle: footNoteRegular(color: ColorManager.gray),
                  dateTextStyle: supTitleBold.copyWith(color: ColorManager.gray),
                  monthTextStyle: footNoteRegular(color: ColorManager.gray),
                ),
              ),
              AppSize.s40.addVerticalSpace,
              const ReminderCard()
            ],
          ),
        ),
      ),
    );
  }
}
