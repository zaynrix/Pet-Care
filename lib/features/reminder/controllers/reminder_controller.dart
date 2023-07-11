part of reminder_module;

class ReminderController extends GetxController {
  static const boxName = "reminderBox";

  Box<ReminderModel>? reminderBox; // Add a nullable type

  String currantDate = DateTime.now().toString().convertToFullDate()!;
  String currantTime = DateTime.now().toString().convertToTime()!;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await Hive.initFlutter(); // Initialize Hive
    Hive.registerAdapter(ReminderModelAdapter());

    try {
      reminderBox = await Hive.openBox<ReminderModel>(boxName); // Open the box and assign it to reminderBox
    } catch (error) {
      // Handle any errors that occur during box opening
      debugPrint("Error opening box: $error");
    }

  }

  final List<ReminderTypeModel> reminderTypes = [
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

  selectPetType({required String type}) {
    for (var item in reminderTypes) {
      item.isSelected = false;
    }
    final index = reminderTypes.indexWhere((element) => element.type == type);
    reminderTypes[index].isSelected = true;
    update();
  }

  //----------------------------selectPetType-----------------------------------
  selectDate(DateTime date) {
    currantDate = date.toString().convertToFullDate()!;
    update();
  }

  //---------------------------convertStringToMinute----------------------------

  int selectedHour = 6;
  int selectedMinute = 32;
  String timeFormat = DateTime.now().toString().convertToTime()!;
  String convertToTimeFormat(int hour, int minute) {
    String hourStr = hour.toString().padLeft(2, '0');
    String minuteStr = minute.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr';
  }

  selectHour(int hour){
    selectedHour = hour;
    timeFormat = convertToTimeFormat(hour, selectedMinute);
    update();
  }

  selectMinute(int minute){
    selectedMinute = minute;
    timeFormat = convertToTimeFormat(selectedHour, minute);
    update();
    print(timeFormat);
  }


}
