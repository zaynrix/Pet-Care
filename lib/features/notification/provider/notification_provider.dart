import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/features/notification/notification_helper.dart';
import 'package:pet_care/features/reminder/models/remonder.dart';
import 'package:pet_care/locator.dart';

import '../../../routing/routing_module.dart';

class NotificationProvider extends ChangeNotifier {
  Future<void> createPlantFoodNotification() async {
    await sl<AwesomeNotifications>().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'basic_channel',
        title:
            '${Emojis.money_money_bag + Emojis.plant_cactus} Buy Plant Food!!!',
        body: 'Florist at 123 Main St. has 2 in stock',
        bigPicture: 'asset://assets/app_icon.jpeg',
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }

  Future<void> createWaterReminderNotification(
      NotificationWeekAndTime notificationSchedule,
      ReminderModel reminder) async {
    print("${reminder.createdAtTime}");
    await sl<AwesomeNotifications>().createNotification(
      content: NotificationContent(
        id: reminder.id,
        channelKey: 'scheduled_channel',
        title: '${reminder.title}',
        body: reminder.description,
        notificationLayout: NotificationLayout.Default,
      ),
      schedule: NotificationCalendar(
        year: notificationSchedule.dayOfTheWeek.year,
        month: notificationSchedule.dayOfTheWeek.month,
        day: notificationSchedule.dayOfTheWeek.day,
        hour: notificationSchedule.timeOfDay.hour,
        minute: notificationSchedule.timeOfDay.minute,
        second: 0,
        millisecond: 0,
        repeats: true,
      ),
    );
  }

  Future<void> cancelScheduledNotifications() async {
    await sl<AwesomeNotifications>().cancelAllSchedules();
  }

  void initNotification() {
    sl<AwesomeNotifications>().initialize(
      'resource://drawable/launcher_icon',
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          // defaultColor: Colors.teal,
          importance: NotificationImportance.High,
          channelShowBadge: true,
          channelDescription: '',
        ),
        NotificationChannel(
          channelKey: 'scheduled_channel',
          channelName: 'Scheduled Notifications',
          locked: true,
          importance: NotificationImportance.High,
          channelDescription: '',
        ),
      ],
    );
  }

  Future allowNotificationsWidget() async {
    await sl<AwesomeNotifications>().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: RouteService.serviceNavi.navKey.currentContext!,
          builder: (context) => AlertDialog(
            title: const Text('Allow Notifications'),
            content: const Text('Our app would like to send you notifications'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Don\'t Allow',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () => sl<AwesomeNotifications>()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        );
      }
    });

    await sl<AwesomeNotifications>().actionStream.listen((notification) {
      if (notification.channelKey == 'basic_channel' && Platform.isIOS) {
        sl<AwesomeNotifications>().getGlobalBadgeCounter().then(
              (value) =>
                  sl<AwesomeNotifications>().setGlobalBadgeCounter(value - 1),
            );
      }
      RouteService.serviceNavi
          .pushNamedAndRemoveUtils(RouteGenerator.mainScreenApp);
    });
  }

  void disposeNotifications() {
    sl<AwesomeNotifications>().actionSink.close();
    sl<AwesomeNotifications>().createdSink.close();
  }
}
