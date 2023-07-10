import 'package:hive_flutter/adapters.dart';
import 'package:pet_care/features/reminder/models/remonder.dart';

class ReminderData{

  static const boxName = "tasksBox";

  final Box<ReminderModel> box = Hive.box<ReminderModel>(boxName);

  Future<void> addReminder({required ReminderModel reminder}) async {
    await box.put(reminder.id, reminder);
  }

  Future<ReminderModel?> getTask({required String id}) async {
    return box.get(id);
  }

  Future<void> updateTask({required ReminderModel reminder}) async {
    await reminder.save();
  }

  Future<void> deleteTask({required ReminderModel task}) async {
    await task.delete();
  }
}