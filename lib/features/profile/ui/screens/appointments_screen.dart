part of profile_module;

class AppointmentsScreen extends StatefulWidget {
   AppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  DateTime today = DateTime.now();

  void onDaySelected(DateTime day , DateTime focusedDay){
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appointments"),

        actions: [
          CustomIconButton(
            onTap: (){},
            iconPath: IconAssets.edit,
          ),
          const RHorizontalSpace(width: AppSize.s20),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.p24.paddingHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSize.s25.addVerticalSpace,
              Text(
                "Select your pet",
                style:
                    footNoteRegular(color: ColorManager.primaryWithTransparent60),
              ),
              13.addVerticalSpace,
              Row(
                children: [
                  Container(
                    padding: 3.paddingAll,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.secondary),
                      shape: BoxShape.circle
                    ),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(ImageAssets.dog),
                    ),
                  ),
                  AppSize.s16.addHorizontalSpace,
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(ImageAssets.dog),
                  ),
                  AppSize.s16.addHorizontalSpace,
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(ImageAssets.dog),
                  ),
                ],
              ),
              AppSize.s25.addVerticalSpace,
              Container(
                padding: AppSize.s16.paddingHorizontal,
                height: 325.height,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: AppSize.s15.circularRadius
                ),
                child:
                TableCalendar(

                  headerStyle:  HeaderStyle(
                    leftChevronIcon: Container(
                      height: AppSize.s30.height,
                      width: AppSize.s30.width,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.secondGray
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: ColorManager.white,
                        size: 28,
                      ),
                    ),
                    rightChevronIcon: Container(
                      height: AppSize.s30.height,
                      width: AppSize.s30.width,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.secondGray
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        color: ColorManager.white,
                        size: 28,
                      ),
                    ),
                    formatButtonVisible: false ,
                      titleCentered: true,
                      titleTextStyle: titleSemiBoldPrimary,
                    headerPadding: EdgeInsets.zero,
                  ),
                  rowHeight: AppSize.s40.height,
                  calendarFormat: CalendarFormat.month,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  daysOfWeekHeight: 26.height,
                  firstDay: DateTime.utc(2010 , 10 , 26),
                  focusedDay: today,
                  lastDay: DateTime.utc(2033 , 10 , 26),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day , today),
                  onDaySelected: onDaySelected,
                  calendarBuilders: const CalendarBuilders(),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: captionRegular,
                    weekendStyle: captionRegular
                  ),
                  calendarStyle:  CalendarStyle(
                    outsideTextStyle: footNoteSemiBold(color: ColorManager.primary),
                    weekendTextStyle: footNoteSemiBold(color: ColorManager.secondGray),
                    defaultTextStyle: footNoteSemiBold(color: ColorManager.secondGray),
                    todayTextStyle: footNoteSemiBold(color: ColorManager.white),
                    selectedTextStyle: footNoteSemiBold(color: ColorManager.secondary),
                    selectedDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorManager.secondary),
                      // color: ColorManager.transparent,
                    ),
                    todayDecoration: const BoxDecoration(
                      color: ColorManager.secondary,
                      shape: BoxShape.circle,
                    ),
                    ),
                ),
              ),
              AppSize.s40.addVerticalSpace,
              const Text("20 June 2022" , style: titleSemiBoldPrimary,),
              AppSize.s16.addVerticalSpace,
              Container(
                padding: AppPadding.p16.paddingAll,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: AppSize.s15.circularRadius,
                  boxShadow: [customShadow()]
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: AppSize.s10.paddingAll,
                      decoration: const BoxDecoration(
                          border: Border(left: BorderSide(color: ColorManager.secondaryLight, width: 2))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Dr. Cristofer Bergson" , style: bodyMedium,),
                          Text("Home Visit" , style: footNoteRegular(color: ColorManager.gray),)
                        ],
                      ),
                    ),
                    AppSize.s16.addVerticalSpace,
                    Row(
                      children: [
                        SvgPicture.asset(IconAssets.clock),
                        AppSize.s6.addHorizontalSpace,
                        Text("09:20 AM" , style: footNoteRegular(color: ColorManager.primary),),
                        const Spacer(),
                        SvgPicture.asset(IconAssets.notificationSelected)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),


    );
  }
}
