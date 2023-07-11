part of reminder_module;

class AddReminderScreen extends StatelessWidget {
  AddReminderScreen({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  DateTime currantDate = DateTime.now();

  final ReminderController reminderController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Add reminder"),
      ),
      body: GetBuilder<ReminderController>(
        builder: (GetxController controller) => Column(
          children: [
            SizedBox(
              height: AppSize.s140.height,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: ReminderController.reminderTypes.length,
                  itemBuilder: (context, index) {
                    final reminderType =
                        ReminderController.reminderTypes[index];
                    return SelectionTypeCard(
                      type: reminderType.type,
                      iconPath: reminderType.iconPath,
                      backgroundColor: reminderType.color,
                      isSelected: reminderType.isSelected,
                      onTap: () {
                        reminderController.selectPetType(
                            type: reminderType.type);
                      },
                    );
                  }),
            ),
            Padding(
              padding: AppSize.s24.paddingHorizontal,
              child: Column(
                children: [
                  AppSize.s32.addVerticalSpace,
                  CustomTextFormField(
                      hintText: "Reminder name",
                      controller: reminderController.titleController,
                      validator: (value) {
                        return null;
                      }),
                  AppSize.s20.addVerticalSpace,
                  ReminderPickerCard(
                    hint: "Date",
                    sheetPage: (context) =>
                        ChooseDateSheet(reminderController: reminderController),
                    title: reminderController.currantDateString,
                  ),
                  AppSize.s20.addVerticalSpace,
                  ReminderPickerCard(
                    hint: "Time",
                    sheetPage: (context) => AddTimeReminderCard(reminderController: reminderController,),
                    title: reminderController.timeFormat,
                  ),
                  (Get.width * 0.2).addVerticalSpace,
                  ElevatedButton(onPressed: (){
                    reminderController.createReminder();
                  },
                      child: const Text("Save"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

