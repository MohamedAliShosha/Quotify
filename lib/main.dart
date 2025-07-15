import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/app_initializers.dart';
import 'package:starter_template/core/utils/app_router.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Lato',
        scaffoldBackgroundColor: ColorsManager.kBlackColor,
      ),
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializers.initializeFirebase();
  runApp(const QuotesApp());
}
