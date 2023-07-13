part of reminder_module;

class AddReminderScreen extends StatelessWidget {
  AddReminderScreen({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();

  GlobalKey<FormState> formKye = GlobalKey<FormState>();

  final ReminderController reminderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Add reminder"),
      ),
      body: GetBuilder<ReminderController>(
        builder: (GetxController controller) => SingleChildScrollView(
          child: Column(
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
                child: Form(
                  key: formKye,
                  child: Column(
                    children: [
                      AppSize.s32.addVerticalSpace,
                      CustomTextFormField(
                          hintText: "Reminder name",
                          controller: reminderController.titleController,
                          validator: (value) => value!.validateUserName()),
                      AppSize.s20.addVerticalSpace,
                      CustomTextFormField(
                          hintText: "Reminder Description",
                          controller: reminderController.descriptionController,
                          validator: (value) => value!.validateUserName()),
                      AppSize.s20.addVerticalSpace,
                      ReminderPickerCard(
                        hint: "Date",
                        sheetPage: (context) => ChooseDateSheet(
                            reminderController: reminderController),
                        title: reminderController.currantDateString,
                      ),
                      AppSize.s20.addVerticalSpace,
                      ReminderPickerCard(
                        hint: "Time",
                        sheetPage: (context) => AddTimeReminderCard(
                          reminderController: reminderController,
                        ),
                        title: ReminderController.currentTimeFormat,
                      ),
                      (Get.width * 0.2).addVerticalSpace,
                      ElevatedButton(
                          onPressed: () {
                            if (formKye.currentState!.validate()) {
                              reminderController.createReminder();
                            }
                          },
                          child: const Text("Save"))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
