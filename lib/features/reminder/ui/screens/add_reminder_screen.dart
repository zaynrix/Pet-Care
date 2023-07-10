part of reminder_module;

class AddReminderScreen extends StatelessWidget {
  AddReminderScreen({Key? key}) : super(key: key);
  final TextEditingController reminderController = TextEditingController();
  DateTime currantDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add reminder"),
      ),
      body: Column(
        children: [
          Padding(
            padding: AppSize.s24.paddingHorizontal,
            child: Column(
              children: [
                AppSize.s32.addVerticalSpace,
                CustomTextFormField(
                    hintText: "Reminder name",
                    controller: reminderController,
                    validator: (value) {
                      return null;
                    }),
                AppSize.s20.addVerticalSpace,
                ReminderPickerCard(
                  sheetPage: (context) => Container(
                    padding: AppSize.s24.paddingAll,
                    height: 383.height,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: AppSize.s16.circularRadius),
                    child: Column(
                      children: [

                        WheelChooser.integer(
                          initValue: 6,
                          selectTextStyle: h2Bold,
                            unSelectTextStyle: h3Medium2,
                            // listHeight: AppSize.s160.height,
                            onValueChanged: (value) {}, maxValue: 12, minValue: 1),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
