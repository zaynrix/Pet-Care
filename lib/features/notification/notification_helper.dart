import 'package:flutter/material.dart';

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

class NotificationWeekAndTime {
  final DateTime dayOfTheWeek;
  final TimeOfDay timeOfDay;

  NotificationWeekAndTime({
    required this.dayOfTheWeek,
    required this.timeOfDay,
  });
}
