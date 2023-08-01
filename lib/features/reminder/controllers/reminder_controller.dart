part of reminder_module;

class ReminderController extends GetxController {
  static const boxName = "reminderBox";

  Box<ReminderModel>? reminderBox;

  String currantDateString = DateTime.now().toString().convertToFullDate()!;
  static DateTime currantDate = DateTime.now();

  String currantTime = DateTime.now().toString().convertToTime24()!;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await Hive.initFlutter(); // Initialize Hive
    Hive.registerAdapter(ReminderModelAdapter());

    try {
      reminderBox = await Hive.openBox<ReminderModel>(boxName);
      update(); // Open the box and assign it to reminderBox
    } catch (error) {
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

  //----------------------------- Select Pet Type----------------------------------

  String selectedReminderType = reminderTypes.first.type;

  selectReminderType({required String type}) {
    for (var item in reminderTypes) {
      item.isSelected = false;
    }
    final index = reminderTypes.indexWhere((element) => element.type == type);
    reminderTypes[index].isSelected = true;
    selectedReminderType = reminderTypes[index].type;
    update();
  }

  //---------------------------- Pickup Date -----------------------------------

  selectDate(DateTime date) {
    currantDateString = date.toString().convertToFullDate()!;
    currantDate = date;
    update();
  }

  //---------------------------- Pickup Time 24h -----------------------------------

  selectTime(DateTime date) {
    currantTime = date.toString().convertToTime24()!;
    currentTimeFormat = currantTime;
    update();
  }

  //--------------------------- Convert String To Minute----------------------------

  static int selectedHour = currantDate.hour;
  static int selectedMinute = currantDate.minute;
  static String currentTimeFormat = formatTime(selectedHour, selectedMinute);

  static String formatTime(int hour, int minute) {
    final hourStr = hour.toString().padLeft(2, '0');
    final minuteStr = minute.toString().padLeft(2, '0');
    final timeFormat = '$hourStr:$minuteStr';
    return timeFormat;
  }

  DateTime convertToDateTime(String timeString) {
    List<String> timeParts = timeString.split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    DateTime now = DateTime.now();
    DateTime dateTime = DateTime(now.year, now.month, now.day, hour, minute);

    return dateTime;
  }

  void selectHour(int hour) {
    selectedHour = hour;
    currentTimeFormat = formatTime(hour, selectedMinute);
    update();
  }

  void selectMinute(int minute) {
    selectedMinute = minute;
    currentTimeFormat = formatTime(selectedHour, minute);
    update();
    debugPrint(currentTimeFormat);
  }

  

//----------------------------- Create New Reminder ----------------------------------

  createReminder() {
    reminderBox!.add(ReminderModel(
        title: titleController.text,
        id: createUniqueId(),
        createdAtDate: currantDate,
        createdAtTime: convertToDateTime(currentTimeFormat),
        isDone: false,
        type: selectedReminderType,
        description: descriptionController.text));
    update();
    RouteService.serviceNavi.pop();
    titleController.clear();
    descriptionController.clear();
  }

  //----------------------------- Delete Reminder ----------------------------------

  deleteReminder(int index) {
    reminderBox!.deleteAt(index);
    update();
  }

  Color decideColorSide({required String reminderType}){
    switch (reminderType) {
      case "Medicine":
        return ColorManager.secondaryLight;
      case "Vaccine":
       return ColorManager.quaternary;
      case "Exercise":
       return ColorManager.greenLight;
      case "Liquid":
        return ColorManager.tertiary;
      default:
        return ColorManager.secondaryLight;
    }

  }
}
