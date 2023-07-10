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
                  hint: "Date",
                  sheetPage: (context) =>  Container(
                    height: Get.height * 0.5,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: AppSize.s25.circularRadius),
                    child: Column(
                      children: [
                        Container(
                          height: AppSize.s60.height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: ColorManager.primaryWithTransparent10))
                          ),
                          child: const Text("Choose Date" , style: titleBold,)
                        ),
                        AppSize.s30.addVerticalSpace,
                        SizedBox(
                          height: AppSize.s160.height,
                          child: CupertinoDatePicker(onDateTimeChanged: (date){},
                            maximumYear: 2026,
                            minimumYear: 2023,
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: DateTime.now(),
                          ),
                        ),
                        AppSize.s40.addVerticalSpace,
                        ElevatedButton(onPressed: (){}, child: const Text("Done")),
                      ],
                    ),
                  ),

                  title: DateTime.now().toString().convertToFullDate()!,
                ),
                AppSize.s20.addVerticalSpace,
                ReminderPickerCard(
                  hint: "Time",
                  sheetPage: (context) => const AddTimeReminderCard(), title: "00:00 AM",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

