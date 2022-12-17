import 'package:flutter/material.dart';
import 'package:time_manager/pages/home.dart';
import 'package:time_manager/pages/home_d.dart';
import 'package:time_manager/pages/cornometer.dart';
import 'package:time_manager/pages/plans.dart';
import 'package:time_manager/pages/test.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid = AndroidInitializationSettings('alarm.png');

  var initializationSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  var initializationSettings = InitializationSettings(initializationSettingsAndroid,initializationSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String payload) async {
    if(payload != null) {debugPrint('notification payload: $payload');}
  });


  runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home': (context) => Home(),
    '/home_d': (context) => Home_d(),
    '/cornometer': (context) => Cornometer(),
    '/plans': (context) => Plans(),
    '/test': (context) => Test(),
  },
));
}

