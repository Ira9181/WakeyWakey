import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'app.dart';
import 'config/injection/injection_container.dart' as di;

/// The top-level notification plugin instance.
/// It must be top-level (not inside a class) so it can be accessed
/// from background isolates when alarms fire.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// main() is the first function Dart runs.
/// Everything here runs BEFORE the UI appears.
void main() async {
  // WidgetsFlutterBinding.ensureInitialized() must be called before
  // using any Flutter plugins in main(). It sets up the connection
  // between Dart and the Flutter engine.
  WidgetsFlutterBinding.ensureInitialized();

  // Force portrait mode only — alarm apps don't need landscape
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize timezone data — needed for scheduling alarms
  // in the correct local timezone
  tz.initializeTimeZones();

  // Initialize Android Alarm Manager — this enables scheduling
  // alarms that fire even when the app is killed
  await AndroidAlarmManager.initialize();

  // Initialize our dependency injection container
  // This registers all repositories, use cases, and blocs
  await di.init();

  // Run the app
  runApp(const AlarmyApp());
}
