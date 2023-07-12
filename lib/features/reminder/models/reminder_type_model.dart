part of reminder_module;
class ReminderTypeModel{
  ReminderTypeModel({
    required this.type,
    required this.color,
    required this.iconPath,
    required this.isSelected,
});
  final String type;
  final String iconPath;
  bool isSelected;
  final Color color;

}