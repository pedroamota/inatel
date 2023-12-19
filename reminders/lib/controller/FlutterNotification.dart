import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CustomNotification {
  final int id;
  final String? title;
  final String? body;

  CustomNotification({
    required this.id,
    required this.title,
    required this.body,
  });
}

class NotificationService {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;
  late AndroidNotificationDetails androidDetails;

  NotificationService() {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupNotifications();
  }

  _setupNotifications() async {
    await _initializeNotification();
  }

  _initializeNotification() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    await localNotificationsPlugin
        .initialize(const InitializationSettings(android: android));
  }

  showNotification(CustomNotification notification) {
    androidDetails = const AndroidNotificationDetails(
      "Reminders",
      "Lembretes",
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
    );
    localNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      NotificationDetails(android: androidDetails),
    );
  }
}
