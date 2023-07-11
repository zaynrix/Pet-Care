part of reminder_module;

class AddTimeReminderCard extends StatelessWidget {
  const AddTimeReminderCard({
    required this.reminderController,
    Key? key,
  }) : super(key: key);

  final ReminderController reminderController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.5,
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: AppSize.s25.circularRadius),
      child: Column(
        children: [
          Container(
            height: AppSize.s60.height,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: ColorManager.primaryWithTransparent10))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("AM", style: bodyRegular(color: ColorManager.gray),),
                AppSize.s25.addHorizontalSpace,
                Text("PM", style: bodyRegular(color: ColorManager.gray),)
              ],
            ),
          ),
          AppSize.s30.addVerticalSpace,
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: AppSize.s160.height,
                  width: Get.width * 0.4,
                  child: Row(
                    children: [
                      SizedBox(
                        height: AppSize.s160.height,
                        width: 65.width,
                        child: WheelChooser.integer(
                            onValueChanged: (hour) {
                              reminderController.selectHour(hour);

                            },
                            maxValue: 12,
                            minValue: 1,
                            initValue: reminderController.selectedHour,
                            selectTextStyle: h2Bold,
                            unSelectTextStyle: h2Bold.copyWith(color: ColorManager.primaryWithTransparent30)
                        ),
                      ),
                      const VerticalDivider(color: ColorManager.gray,),
                      SizedBox(
                        height: AppSize.s160.height,
                        width: 65.width,
                        child: WheelChooser.integer(
                            onValueChanged: (minute) {
                              reminderController.selectMinute(minute);
                            },
                            maxValue: 60,
                            minValue: 1,
                            initValue: reminderController.selectedMinute,
                            // itemSize: 70,
                            selectTextStyle: h2Bold,
                            unSelectTextStyle: h3Medium2
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: Get.width * 1,
                height: Get.height * 0.09,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: const Alignment(0, 1),
                        end: const Alignment(0.00, -1.00),
                        colors: [ ColorManager.white.withOpacity(0) , ColorManager.white ]
                    )
                ),
              ),
              // Positioned(
              //     bottom: 0,
              //     child: Container(
              //       width: Get.width * 1,
              //       height: Get.height * 0.09,
              //       decoration: BoxDecoration(
              //           gradient: LinearGradient(
              //               begin: const Alignment(0, 1),
              //               end: const Alignment(0.00, -1.00),
              //               colors: [   ColorManager.white ,ColorManager.white.withOpacity(0)]
              //           )
              //       ),
              //     )
              // ),
            ],
          ),
          AppSize.s40.addVerticalSpace,
          ElevatedButton(onPressed: (){}, child: const Text("Done")),
        ],
      ),
    );
  }
}
