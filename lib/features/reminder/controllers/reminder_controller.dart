part of reminder_module;

class ReminderController extends GetxController {
  static const boxName = "reminderBox";

  Box<ReminderModel>? reminderBox; // Add a nullable type

  String currantDateString = DateTime.now().toString().convertToFullDate()!;
  DateTime currantDate = DateTime.now();

  String currantTime = DateTime.now().toString().convertToTime()!;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await Hive.initFlutter(); // Initialize Hive
    Hive.registerAdapter(ReminderModelAdapter());

    try {
      reminderBox = await Hive.openBox<ReminderModel>(
          boxName); // Open the box and assign it to reminderBox
    } catch (error) {
      // Handle any errors that occur during box opening
      debugPrint("Error opening box: $error");
    }
  }

  static final List<ReminderTypeModel> reminderTypes = [
    ReminderTypeModel(
        type: "Medicine",
        color: ColorManager.secondaryLight,
        iconPath: IconAssets.pill,
        isSelected: true),
    ReminderTypeModel(
        type: "Vaccine",
        color: ColorManager.quaternary,
        iconPath: IconAssets.vaccine,
        isSelected: false),
    ReminderTypeModel(
        type: "Exercise",
        color: ColorManager.greenLight,
        iconPath: IconAssets.exercise,
        isSelected: false),
    ReminderTypeModel(
        type: "Liquid",
        color: ColorManager.tertiary,
        iconPath: IconAssets.liquid,
        isSelected: false),
  ];

  //-----------------------------selectPetType----------------------------------

  String selectedReminderType = reminderTypes.first.type;

  selectPetType({required String type}) {
    for (var item in reminderTypes) {
      item.isSelected = false;
    }
    final index = reminderTypes.indexWhere((element) => element.type == type);
    reminderTypes[index].isSelected = true;
    selectedReminderType = reminderTypes[index].type;
    update();
  }

  //----------------------------selectPetType-----------------------------------
  selectDate(DateTime date) {
    currantDateString = date.toString().convertToFullDate()!;
    currantDate = date;
    update();
  }

  //---------------------------convertStringToMinute----------------------------

  int selectedHour = 6;
  int selectedMinute = 32;
  String timeOfDate = "AM";

  String timeFormat = DateTime.now().toString().convertToTime()!;

  String convertToTimeFormat(int hour, int minute) {
    String hourStr = hour.toString().padLeft(2, '0');
    String minuteStr = minute.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr';
  }

  selectHour(int hour) {
    selectedHour = hour;
    timeFormat = "${convertToTimeFormat(hour, selectedMinute)} $timeOfDate";
    update();
  }

  selectMinute(int minute) {
    selectedMinute = minute;
    timeFormat = "${convertToTimeFormat(selectedHour, minute)} $timeOfDate";
    update();
    print(timeFormat);
  }

  void selectTimeOfDate(String value) {
    timeOfDate = value;
    timeFormat = "$selectedHour:$selectedMinute $timeOfDate";
    update();
  }

  createReminder() {
    reminderBox!.add(ReminderModel(
        title: titleController.text,
        id: createUniqueId(),
        createdAtDate: currantDate,
        createdAtTime: DateTime.now(),
        isDone: false,
        type: selectedReminderType,
        description: descriptionController.text));
    update();
    RouteService.serviceNavi.pop();
  }

  deleteReminder(int index){
    reminderBox!.deleteAt(index);
    update();
  }

  TimeOfDay convertStringToTimeOfDay(String timeString) {
    List<String> timeParts = timeString.split(' ');
    String time = timeParts[0];
    String meridiem = timeParts[1];

    List<String> timeValues = time.split(':');
    int hour = int.parse(timeValues[0]);
    int minute = int.parse(timeValues[1]);

    if (meridiem == 'PM' && hour < 12) {
      hour += 12;
    }

    return TimeOfDay(hour: hour, minute: minute);
  }

}


