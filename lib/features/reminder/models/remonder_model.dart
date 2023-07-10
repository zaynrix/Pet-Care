
import 'package:hive/hive.dart';
import 'package:pet_care/utils/helper.dart';

@HiveType(typeId: 1)
class ReminderModel{

  ReminderModel({
    required this.title,
    required this.id,
    required this.createdAtDate,
    required this.createdAtTime,
    required this.duration,
    required this.isDone,
});

  @HiveField(0)
final int id;

  @HiveField(1)
final String title;

  @HiveField(2)
final bool isDone;

  @HiveField(3)
final int duration;

  @HiveField(4)
DateTime createdAtTime;

  @HiveField(5)
DateTime createdAtDate;

  factory ReminderModel.create({
    required String title,
    required DateTime createdAtTime,
    required DateTime createdAtDate,
    bool? isDone,
    int? duration,
}) => ReminderModel(title: title, id: createUniqueId(), createdAtDate: createdAtDate, createdAtTime: createdAtTime, duration: 0, isDone: false);
}