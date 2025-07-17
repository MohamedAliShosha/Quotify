import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/app_initializers.dart';
import 'package:starter_template/core/utils/app_router.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/core/utils/service_locator.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsManager.kBlackColor,
        fontFamily: 'Lato',
      ),
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializers.initializeFirebase();
  setUpServiceLocator();
  runApp(const QuotesApp());
}
