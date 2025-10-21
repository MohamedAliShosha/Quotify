import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/core/utils/app_initializers.dart';
import 'package:starter_template/core/utils/app_router.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/core/utils/service_locator.dart';
import 'package:starter_template/core/utils/shared_pref_helper.dart';
import 'package:starter_template/core/utils/shared_pref_keys.dart';
import 'package:starter_template/core/utils/simple_bloc_observer.dart';
import 'package:starter_template/features/saved_quotes/presentation/manager/read_quotes/read_quotes_cubit.dart';

Future<void> checkIfUserIsLoggedIn() async {
  // Getting userToken and storing it in a variable
  final userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  // Check if the userToken is not null and not empty

  if (userToken != null && userToken.isNotEmpty) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}

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
