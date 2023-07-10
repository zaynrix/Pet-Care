import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_care/features/reminder/models/remonder.dart';

class HiveService{

  static const boxName = "tasksBox";
static initHive() async {
  await Hive.initFlutter();
  var box = await Hive.openBox(boxName);
  Hive.registerAdapter<ReminderModel>(ReminderModelAdapter());
  for (var reminder in box.values) {
    if (reminder.createdAtTime.day != DateTime.now().day) {
      reminder.delete();
    } else {}
  }
}
  //
  // final Box<ReminderModel> box = Hive.box<ReminderModel>(boxName);
  //
  // Future<void> addReminder({required ReminderModel reminder}) async {
  //   await box.put(reminder.id, reminder);
  // }
  //
  // Future<ReminderModel?> getTask({required String id}) async {
  //   return box.get(id);
  // }
  //
  // Future<void> updateTask({required ReminderModel reminder}) async {
  //   await reminder.save();
  // }
  //
  // Future<void> deleteTask({required ReminderModel task}) async {
  //   await task.delete();
  // }
  //
}