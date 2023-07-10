import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_care/features/reminder/models/remonder.dart';

class HiveService{

static initHive() async {
  await Hive.initFlutter();
  await Hive.openBox("reminder_box");
  // Hive.registerAdapter(ReminderModel);
}
}