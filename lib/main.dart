import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/app_initializers.dart';
import 'core/utils/app_router.dart';
import 'core/utils/colors_manager.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'features/saved_quotes/presentation/manager/read_quotes/read_quotes_cubit.dart';

import 'core/functions/is_logged_in_user.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReadQuotesCubit(),
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
  await AppInitializers.initializeHive();
  Bloc.observer = SimpleBlocObserver();
  // await setUpServiceLocator();
  AppInitializers.registerQuotesModelAdapter();
  await AppInitializers.openSavedQuotesBox();
  await checkIfUserIsLoggedIn();
  setUpGetIt();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const QuotesApp());
}
