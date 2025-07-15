import 'package:go_router/go_router.dart';
import 'package:starter_template/features/Auth/SignIn/presentation/views/sign_in_view.dart';
import 'package:starter_template/features/Auth/SignUp/presentation/views/sign_up_view.dart';
import 'package:starter_template/features/OnBoarding/presentation/views/on_boarding_view.dart';
import 'package:starter_template/features/Quotes/presentation/views/quotes_view.dart';

abstract class AppRouter {
  // The first thing when creating routers is declaring routes variables
  static const kSignInView = '/signInView';
  static const kSignUpView = '/signUpView';
  static const onBoardingView = '/onBoardingView';
  static const kQuotesView = '/quotesView';
  static const kProfileView = '/profileView';

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
          return const SignUpView();
        },
      ),
      GoRoute(
        path: '/quotesView',
        builder: (context, state) {
          return const QuotesView();
        },
      )
    ],
  );
}
