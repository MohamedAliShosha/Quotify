import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:starter_template/core/utils/constants.dart';
import 'package:starter_template/features/profile/data/models/user_model.dart';
import 'package:starter_template/features/quotes/data/models/quotes_model.dart';

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

  static Future<void> openUserBox() async {
    await Hive.openBox<UserModel>(Constants.kUserBox);
  }

  static Future<void> openSavedQuotesBox() async {
    await Hive.openBox<QuotesModel>(Constants.kSavedQuotesBox);
  }

  static void registerQuotesModelAdapter() {
    Hive.registerAdapter(QuotesModelAdapter());
  }

  static void registerUserModelAdapter() {
    Hive.registerAdapter(UserModelAdapter());
  }
}
