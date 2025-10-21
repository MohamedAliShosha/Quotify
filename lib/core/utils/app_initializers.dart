import 'package:hive_flutter/hive_flutter.dart';
import 'package:starter_template/core/utils/constants.dart';
import 'package:starter_template/features/quotes/data/models/quotes_model.dart';

abstract class AppInitializers {
  static Future<void> initializeHive() async {
    await Hive.initFlutter();
  }

  static Future<void> openSavedQuotesBox() async {
    await Hive.openBox<QuotesModel>(Constants.kSavedQuotesBox);
  }

  static void registerQuotesModelAdapter() {
    Hive.registerAdapter(QuotesModelAdapter());
  }
}
