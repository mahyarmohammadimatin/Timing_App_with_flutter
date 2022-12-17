import 'package:flutter/material.dart';
import 'package:time_manager/PicsAndColors/colors.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:time_manager/main.dart';



class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('test page')),
      body: null,
      floatingActionButton: FloatingActionButton(onPressed: () {alarm();}),
    );
  }
}

void alarm() async{
  var date = DateTime.now().add(Duration(seconds: 10));

  var android = AndroidNotificationDetails(
    'alarm_notif',
    'alarm_notif',
    'channel for alarm notification',
    icon: 'alarm.png',
    sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
  );

  var ios = IOSNotificationDetails(
    sound: 'a_long_cold_sting.wav',
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  var platform = NotificationDetails(android, ios);

  await flutterLocalNotificationsPlugin.schedule(0, 'title', 'my text is coming here', date, platform);

}