import 'package:hive/hive.dart';
import 'package:pet_care/utils/helper.dart';
part 'remonder.g.dart';

@HiveType(typeId: 1)
class ReminderModel extends HiveObject{

  ReminderModel({
    required this.title,
    required this.id,
    required this.createdAtDate,
    required this.createdAtTime,
    required this.isDone,
    required this.type
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String type;

  @HiveField(3)
  final bool isDone;

  @HiveField(5)
  DateTime createdAtTime;

  @HiveField(6)
  DateTime createdAtDate;

//   factory ReminderModel.create({
//     required String title,
//     required DateTime createdAtTime,
//     required DateTime createdAtDate,
//     bool? isDone,
//     required String type,
//   }) =>
//       ReminderModel(
//         type: type,
//           title: title,
//           id: createUniqueId(),
//           createdAtDate: createdAtDate,
//           createdAtTime: createdAtTime,
//           isDone: false);
}
