import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_template/core/utils/service_locator.dart';
import 'package:starter_template/features/Auth/SignIn/data/repos/Sign_Up_Repos/sign_up_repo_implement.dart';
import 'package:starter_template/features/Auth/SignIn/data/repos/sign_in_repo_implement.dart';
import 'package:starter_template/features/Auth/SignIn/presentation/manager/Sign_In_cubit/sign_in_cubit.dart';
import 'package:starter_template/features/Auth/SignIn/presentation/views/sign_in_view.dart';
import 'package:starter_template/features/Auth/SignUp/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:starter_template/features/Auth/SignUp/presentation/views/sign_up_view.dart';
import 'package:starter_template/features/OnBoarding/presentation/views/on_boarding_view.dart';
import 'package:starter_template/features/Home/presentation/views/home_view.dart';
import 'package:starter_template/features/Quotes/presentation/views/quotes_view.dart';
import 'package:starter_template/features/SavedQuotes/presentation/views/save_quotes_view.dart';

abstract class AppRouter {
  // The first thing when creating routers is declaring routes variables
  static const kSignInView = '/signInView';
  static const kSignUpView = '/signUpView';
  static const onBoardingView = '/onBoardingView';
  static const kQuotesView = '/quotesView';
  static const kHomeView = '/homeView';
  static const kProfileView = '/profileView';
  static const kSaveQuotesView = '/saveQuotesView';

  // Then creating the router variable that = GoRouter"Contains a list of routes"
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const OnBoardingView();
        },
      ),
      GoRoute(
        path: '/signInView',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SignInCubit(getIt<SignInRepoImplement>()),
            child: const SignInView(),
          );
        },
      ),
      GoRoute(
        path: '/signUpView',
        builder: (context, state) {
          return BlocProvider(
              create: (context) => SignUpCubit(getIt<SignUpRepoImplement>()),
              child: const SignUpView());
        },
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: '/quotesView',
        builder: (context, state) {
          return const QuotesView();
        },
      ),
      GoRoute(
        path: '/saveQuotesView',
        builder: (context, state) {
          return const SaveQuotesView();
        },
      ),
    ],
  );
}
