part of reminder_module;

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text("Reminder"),
            Text("Today ${DateTime.now().toString().convertToFullDate()!}" , style: captionRegular,),
          ],
        ),
        actions: [
          CustomIconButton(onTap: (){}, iconPath: IconAssets.plus),
          AppSize.s40.addHorizontalSpace
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSize.s24.paddingAll,
          child: Column(
            children: [
              ReminderCard()
            ],
          ),
        ),
      ),
    );
  }
}

