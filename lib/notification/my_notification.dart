import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../main.dart';

const RawResourceAndroidNotificationSound androidNotificationSound =
    RawResourceAndroidNotificationSound('order_alert');

const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('com.brown.store.brown_store', 'BROWN Store',
        channelDescription: 'Alert notification',
        importance: Importance.max,
        priority: Priority.high,
        enableVibration: true,
        sound: androidNotificationSound,
        playSound: true);

const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

Future<void> showNotification() async {
  await flutterLocalNotificationsPlugin.show(
      1, 'New Order', 'Please confirm new order', platformChannelSpecifics,
      payload: 'item x');
}

Future<void> showInboxNotification() async {
  final List<String> lines = <String>['Please <b>Confirm</b>'];
  final InboxStyleInformation inboxStyleInformation = InboxStyleInformation(
      lines,
      htmlFormatLines: true,
      contentTitle: 'New Order',
      htmlFormatContentTitle: true,
      summaryText: 'New <i>Order</i>',
      htmlFormatSummaryText: true);
  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails('inbox channel id', 'inboxchannel name',
          channelDescription: 'inbox channel description',
          styleInformation: inboxStyleInformation);
  final NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(0, 'BROWN store',
      'Have new order Please confirm!', platformChannelSpecifics);
}

Future<void> showNotificationCustomSound(
    String title, String bodyContent) async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('com.brown.store.brown_store', 'BROWN Store',
          channelDescription: 'your other channel description',
          sound: RawResourceAndroidNotificationSound('order_alert'),
          playSound: true,
          importance: Importance.max,
          priority: Priority.high);

  final NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );
  await flutterLocalNotificationsPlugin.show(
    1,
    title,
    bodyContent,
    notificationDetails,
  );
}

Future<void> showNotificationCustomSound2(
    {String title = "notif", String bodyContent = "Content"}) async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails("channel.id", "channel.name",
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          sound:
              const UriAndroidNotificationSound("assets/sound/order_alert.mp3"),
          icon: '@mipmap/ic_launcher');

  final NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );
  await flutterLocalNotificationsPlugin.show(
    1,
    title,
    bodyContent,
    notificationDetails,
  );
}
