import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:starter_template/core/utils/app_initializers.dart';
import 'package:starter_template/core/utils/app_router.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/core/utils/constants.dart';
import 'package:starter_template/core/utils/service_locator.dart';
import 'package:starter_template/features/Quotes/data/repos/quotes_repo_implement.dart';
import 'package:starter_template/features/Quotes/presentation/manager/quotes_cubit/quotes_cubit.dart';
import 'package:starter_template/features/SavedQuotes/data/models/saved_quotes_model.dart';
import 'package:starter_template/features/SavedQuotes/data/repos/save_quote_repo_implement.dart';
import 'package:starter_template/features/SavedQuotes/presentation/manager/SaveQuote/save_quote_cubit.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuotesCubit(
            getIt<QuotesRepoImplement>(),
          ),
        ),
        BlocProvider(
          create: (context) => SavedQuotesCubit(
            SaveQuoteRepoImplement(),
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
  Hive.registerAdapter(SavedQuotesModelAdapter()); // Register Hive adapter
  await Hive.openBox(Constants.kSavedQuotesBox); // Open Hive Box
  setUpServiceLocator();
  runApp(const QuotesApp());
}
