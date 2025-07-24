import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_template/features/auth/SignIn/data/repos/Sign_Up_Repos/sign_up_repo_implement.dart';
import 'package:starter_template/features/auth/SignIn/presentation/views/sign_in_view.dart';
import 'package:starter_template/features/auth/SignUp/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:starter_template/features/auth/SignUp/presentation/views/sign_up_view.dart';
import 'package:starter_template/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:starter_template/features/home/presentation/views/home_view.dart';
import 'package:starter_template/features/profile/presentation/views/profile_view.dart';
import 'package:starter_template/features/quotes/presentation/views/quotes_view.dart';

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
          return const SignInView();
        },
      ),
      GoRoute(
        path: '/signUpView',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SignUpCubit(SignUpRepoImplement()),
            child: const SignUpView(),
          );
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
        path: '/profileView',
        builder: (context, state) {
          return const ProfileView();
        },
      ),
    ],
  );
}
