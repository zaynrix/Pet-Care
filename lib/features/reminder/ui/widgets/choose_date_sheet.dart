part of reminder_module;

class ChooseDateSheet extends StatelessWidget {
  const ChooseDateSheet({
    Key? key,
    required this.reminderController,
  }) : super(key: key);

  final ReminderController reminderController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.5,
      decoration: BoxDecoration(
          color: ColorManager.white, borderRadius: AppSize.s25.circularRadius),
      child: Column(
        children: [
          Container(
              height: AppSize.s60.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: ColorManager.primaryWithTransparent10))),
              child: const Text(
                "Choose Date",
                style: titleBold,
              )),
          AppSize.s30.addVerticalSpace,
          SizedBox(
            height: AppSize.s160.height,
            child: CupertinoDatePicker(
              onDateTimeChanged: (date) {
                reminderController.selectDate(date);
              },
              maximumYear: 2026,
              minimumYear: 2023,
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
            ),
          ),
          AppSize.s40.addVerticalSpace,
          ElevatedButton(onPressed: () {
            RouteService.serviceNavi.pop();
          }, child: const Text("Done")),
        ],
      ),
    );
  }
}
