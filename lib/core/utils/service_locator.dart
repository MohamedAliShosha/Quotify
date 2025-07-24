// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:starter_template/core/utils/api_service.dart';
// import 'package:starter_template/features/Auth/SignIn/data/repos/Sign_Up_Repos/sign_up_repo_implement.dart';
// import 'package:starter_template/features/Auth/SignIn/data/repos/sign_in_repo_implement.dart';
// import 'package:starter_template/features/Auth/SignIn/presentation/manager/Sign_In_cubit/sign_in_cubit.dart';
// import 'package:starter_template/features/Auth/SignUp/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
// import 'package:starter_template/features/quotes/data/repos/quotes_repo_implement.dart';
// import 'package:starter_template/features/saved_quotes/data/repos/save_quote_repo_implement.dart';

// //  Create a global instance of GetIt to be used throughout the app
// final getIt = GetIt.instance;

// Future<void> setUpServiceLocator() async {
//   /*
//     - Use registerSingleton for the repo because:
//     - It has no changing state
//     - One instance is enough for the whole app
//   */
//   getIt.registerFactory<SignInRepoImplement>(() => SignInRepoImplement());
//   getIt.registerFactory<SignUpRepoImplement>(() => SignUpRepoImplement());
//   getIt.registerSingleton<ApiServices>(
//     ApiServices(
//       Dio(),
//     ),
//   );
//   getIt.registerSingleton(SaveQuoteRepoImplement());
//   getIt.registerSingleton<QuotesRepoImplement>(
//     QuotesRepoImplement(
//       getIt<ApiServices>(),
//     ),
//   );
//   /*
//     - Use registerFactory for the cubit:
//     - It holds UI state
//     - We need a new instance every time 
//   */
//   getIt.registerFactory<SignInCubit>(
//     () => SignInCubit(getIt<SignInRepoImplement>()),
//   );
//   getIt.registerFactory<SignUpCubit>(
//     () => SignUpCubit(getIt<SignUpRepoImplement>()),
//   );
// }
