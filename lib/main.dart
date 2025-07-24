import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:starter_template/core/utils/api_service.dart';
import 'package:starter_template/core/utils/app_initializers.dart';
import 'package:starter_template/core/utils/app_router.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/core/utils/constants.dart';
import 'package:starter_template/features/quotes/data/models/quotes_model.dart';
import 'package:starter_template/features/quotes/data/repos/quotes_repo_implement.dart';
import 'package:starter_template/features/quotes/presentation/manager/quotes_cubit/quotes_cubit.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuotesCubit(
            QuotesRepoImplement(
              ApiServices(
                Dio(),
              ),
            ),
          ),
        ),
      ],
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
  // await setUpServiceLocator();
  await AppInitializers.initializeHive();
  Hive.registerAdapter(QuotesModelAdapter());
  await Hive.openBox(Constants.kSavedQuotesBox); // Open Hive Box
  runApp(const QuotesApp());
}
