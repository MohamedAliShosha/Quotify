import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class AppInitializers {
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.debug,
    );
  }

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
  }
}
