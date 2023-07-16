part of reminder_module;

class ReminderController extends GetxController {
  static const boxName = "reminderBox";

  Box<ReminderModel>? reminderBox;
  // Add a nullable type

  String currantDateString = DateTime.now().toString().convertToFullDate()!;
  static DateTime currantDate = DateTime.now();

  String currantTime = DateTime.now().toString().convertToTime24()!;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await Hive.initFlutter(); // Initialize Hive
    Hive.registerAdapter(ReminderModelAdapter());

    try {
      reminderBox = await Hive.openBox<ReminderModel>(boxName);
      update(); // Open the box and assign it to reminderBox
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
  //---------------------------convertStringToMinute----------------------------

  static int selectedHour = currantDate.hour;
  static int selectedMinute = currantDate.minute;
  String timeOfDate = "AM";
  static String currentTimeFormat = formatTime(selectedHour, selectedMinute);

  static String formatTime(int hour, int minute) {
    final hourStr = hour.toString().padLeft(2, '0');
    final minuteStr = minute.toString().padLeft(2, '0');
    final timeFormat = '$hourStr:$minuteStr';
    return timeFormat;
  }

  DateTime parseTime(String value) {
    final inputFormat = DateFormat("hh:mm a");
    final selectedTime = inputFormat.parse(value);
    return selectedTime;
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
  }

  DateTime selectTimeOfDate(String value) {
    int selectedHour = int.parse(value.split(':')[0]);
    int selectedMinute = int.parse(value.split(':')[1].split(' ')[0]);
    String timeOfDate = value.split(' ')[1];
    // Get the current date and time
    DateTime now = DateTime.now();

    // Create a new DateTime object with the selected hour and minute
    DateTime selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      selectedHour,
      selectedMinute,
    );
    return selectedDateTime;
  }

  createReminder() {
    reminderBox!.add(ReminderModel(
        title: titleController.text,
        id: createUniqueId(),
        createdAtDate: currantDate,

        /// TODO: This need Fixed
        createdAtTime: DateTime.now(),
        isDone: false,
        type: selectedReminderType,
        description: descriptionController.text));
    update();
    RouteService.serviceNavi.pop();
    titleController.clear();
    descriptionController.clear();
  }

  deleteReminder(int index) {
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
