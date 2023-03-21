import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/src/data/sources/remote/driver/firebase_notification/notification_services.dart';
import 'package:untitled/src/di/injector.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await NotificationService().initializeNotificationService();
  await initializeDependencies();
}
