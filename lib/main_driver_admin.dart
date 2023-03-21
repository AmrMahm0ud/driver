import 'package:flutter/material.dart';
import 'package:untitled/init_app.dart';
import 'package:untitled/my_app.dart';
import 'flavors.dart';

Future<void> main() async{
  Flavors.appFlavor = FlavorEnum.DRIVER_ADMIN;
  await initApp();
  runApp(const MyApp());
}
