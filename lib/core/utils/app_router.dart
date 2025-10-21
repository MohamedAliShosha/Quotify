import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_template/core/utils/service_locator.dart';
import 'package:starter_template/features/auth/login/data/repos/login_repo.dart';
import 'package:starter_template/features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:starter_template/features/auth/sign_up/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:starter_template/features/auth/sign_up/presentation/views/sign_up_view.dart';
import 'package:starter_template/features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:starter_template/features/auth/login/presentation/views/login_view.dart';
import 'package:starter_template/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:starter_template/features/home/presentation/views/home_view.dart';
import 'package:starter_template/features/profile/presentation/views/profile_view.dart';
import 'package:starter_template/features/quotes/data/repos/quotes_repo.dart';
import 'package:starter_template/features/quotes/presentation/manager/quotes_cubit/quotes_cubit.dart';
import 'package:starter_template/features/quotes/presentation/views/quotes_view.dart';
import 'package:starter_template/features/saved_quotes/presentation/manager/save_quotes/save_quotes_cubit.dart';
import 'package:starter_template/features/saved_quotes/presentation/views/saved_quotes_view.dart';

abstract class AppRouter {
  // The first thing when creating routers is declaring routes variables
  static const kLoginView = '/loginView';
  static const kSignUpView = '/signUpView';
  static const onBoardingView = '/onBoardingView';
  static const kQuotesView = '/quotesView';
  static const kHomeView = '/homeView';
  static const kProfileView = '/profileView';
  static const kSaveQuotesView = '/savedQuotesView';

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
        path: '/loginView',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => LoginCubit(
              getIt<LoginRepo>(),
            ),
            child: const LoginView(),
          );
        },
      ),
      GoRoute(
        path: '/signUpView',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SignUpCubit(
              getIt<SignUpRepo>(),
            ),
            child: const SignUpView(),
          );
        },
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => QuotesCubit(
                  getIt<QuotesRepo>(),
                ),
              ),
              BlocProvider(
                create: (context) => SaveQuotesCubit(),
              ),
            ],
            child: const HomeView(),
          );
        },
      ),
      GoRoute(
        path: '/quotesView',
        builder: (context, state) {
          return const QuotesView();
        },
      ),
      GoRoute(
        path: '/profileView',
        builder: (context, state) {
          return const ProfileView();
        },
      ),
      GoRoute(
        path: '/savedQuotesView',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SaveQuotesCubit(),
            child: const SavedQuotesView(),
          );
        },
      ),
    ],
  );
}
