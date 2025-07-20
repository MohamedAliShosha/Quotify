import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/core/utils/api_service.dart';
import 'package:starter_template/core/utils/app_initializers.dart';
import 'package:starter_template/core/utils/app_router.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/core/utils/service_locator.dart';
import 'package:starter_template/features/Quotes/data/repos/quotes_repo_implement.dart';
import 'package:starter_template/features/Quotes/presentation/manager/quotes_cubit/quotes_cubit.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuotesCubit(QuotesRepoImplement(ApiServices(Dio()))),
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsManager.kBlackColor,
          fontFamily: 'Lato',
        ),
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializers.initializeFirebase();
  setUpServiceLocator();
  runApp(const QuotesApp());
}
