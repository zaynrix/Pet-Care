import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/features/notification/notification_helper.dart';
import 'package:pet_care/features/reminder/models/remonder.dart';

class NotificationProvider extends ChangeNotifier {
  Future<void> createPlantFoodNotification() async {
    await AwesomeNotifications().createNotification(
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
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: reminder.id, // Use the reminder ID for uniqueness
        channelKey: 'scheduled_channel',
        title:
            '${Emojis.wheater_droplet} ${reminder.title}', // Use the reminder title
        body: reminder.description, // Use the reminder description
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
        ),
      ],
      schedule: NotificationCalendar(
        weekday: notificationSchedule.dayOfTheWeek,
        hour: notificationSchedule.timeOfDay.hour,
        minute: notificationSchedule.timeOfDay.minute,
        second: 0,
        millisecond: 0,
        repeats: true,
      ),
    );
  }

  Future<void> cancelScheduledNotifications() async {
    await AwesomeNotifications().cancelAllSchedules();
  }

  void initNotification() {
    print("initNotification");
  }

  // void allowNotificationsWidget() {
  //   AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
  //     if (!isAllowed) {
  //       showDialog(
  //         context: RouteService.serviceNavi.navKey.currentContext!,
  //         builder: (context) => AlertDialog(
  //           title: const Text('Allow Notifications'),
  //           content: const Text('Our app would like to send you notifications'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: const Text(
  //                 'Don\'t Allow',
  //                 style: TextStyle(
  //                   color: Colors.grey,
  //                   fontSize: 18,
  //                 ),
  //               ),
  //             ),
  //             TextButton(
  //                 onPressed: () => AwesomeNotifications()
  //                     .requestPermissionToSendNotifications()
  //                     .then((_) => Navigator.pop(context)),
  //                 child: const Text(
  //                   'Allow',
  //                   style: TextStyle(
  //                     color: Colors.teal,
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ))
  //           ],
  //         ),
  //       );
  //     }
  //   });
  //
  //   AwesomeNotifications().createdStream.listen((notification) {
  //     ScaffoldMessenger.of(RouteService.serviceNavi.navKey.currentContext!)
  //         .showSnackBar(SnackBar(
  //       content: Text(
  //         'Notification Created on ${notification.channelKey}',
  //       ),
  //     ));
  //   });
  //
  //   AwesomeNotifications().actionStream.listen((notification) {
  //     if (notification.channelKey == 'basic_channel' && Platform.isIOS) {
  //       AwesomeNotifications().getGlobalBadgeCounter().then(
  //             (value) =>
  //                 AwesomeNotifications().setGlobalBadgeCounter(value - 1),
  //           );
  //     }
  //
  //     // Navigator.pushAndRemoveUntil(
  //     //   context,
  //     //   MaterialPageRoute(
  //     //     builder: (_) => const PlantStatsPage(),
  //     //   ),
  //     //   (route) => route.isFirst,
  //     // );
  //   });
  // }

  void disposeNotifications() {
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
  }
}
