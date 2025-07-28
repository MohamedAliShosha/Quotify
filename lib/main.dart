import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/core/utils/api_service.dart';
import 'package:starter_template/core/utils/app_initializers.dart';
import 'package:starter_template/core/utils/app_router.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/core/utils/simple_bloc_observer.dart';
import 'package:starter_template/features/profile/data/services/user_data_service.dart';
import 'package:starter_template/features/profile/presentation/manager/user_data/user_data_cubit.dart';
import 'package:starter_template/features/quotes/data/repos/quotes_repo_implement.dart';
import 'package:starter_template/features/quotes/presentation/manager/quotes_cubit/quotes_cubit.dart';
import 'package:starter_template/features/saved_quotes/presentation/manager/read_quotes/read_quotes_cubit.dart';
import 'package:starter_template/features/saved_quotes/presentation/manager/save_quotes/save_quotes_cubit.dart';

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
        BlocProvider(
          create: (context) => SaveQuotesCubit(),
        ),
        BlocProvider(
          create: (context) => ReadQuotesCubit(),
        ),
        BlocProvider(
          create: (context) => UserDataCubit(
            UserDataService(),
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
  await AppInitializers.initializeHive();
  Bloc.observer = SimpleBlocObserver();
  // await setUpServiceLocator();
  AppInitializers.registerUserModelAdapter();
  AppInitializers.registerQuotesModelAdapter();
  await AppInitializers.openUserBox();
  await AppInitializers.openSavedQuotesBox();
  runApp(const QuotesApp());
}
