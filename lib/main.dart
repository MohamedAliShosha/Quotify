import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/app_router.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const QuotesApp());
}
