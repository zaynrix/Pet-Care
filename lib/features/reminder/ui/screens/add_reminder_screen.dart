part of reminder_module;

class AddReminderScreen extends StatelessWidget {
   AddReminderScreen({Key? key}) : super(key: key);
  final TextEditingController reminderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add reminder"),
      ),
      body: Column(

        children: [
          AppSize.s32.addVerticalSpace,
          CustomTextFormField(hintText: "Reminder name", controller: reminderController, validator: (value){
            return null;
          }),
          AppSize.s20.addVerticalSpace,

        ],
      ),
    );
  }
}
