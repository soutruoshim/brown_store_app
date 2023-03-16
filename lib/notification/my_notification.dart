import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';

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
  await flutterLocalNotificationsPlugin.show(
      0, 'BROWN store', 'Have new order Please confirm!', platformChannelSpecifics);
}

Future<void> showSoundUriNotification() async {
  /// this calls a method over a platform channel implemented within the
  /// example app to return the Uri for the default alarm sound and uses
  /// as the notification sound
  final String? alarmUri = await platform.invokeMethod<String>('getAlarmUri');
  final UriAndroidNotificationSound uriSound =
  UriAndroidNotificationSound(alarmUri!);
  final AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails('uri channel id', 'uri channel name',
      channelDescription: 'uri channel description',
      sound: uriSound,
      styleInformation: const DefaultStyleInformation(true, true));
  final NotificationDetails platformChannelSpecifics =
  NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
      0, 'uri sound title', 'uri sound body', platformChannelSpecifics);
}
