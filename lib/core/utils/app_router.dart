import 'package:go_router/go_router.dart';
import 'package:starter_template/features/OnBoarding/presentation/views/on_boarding_view.dart';

abstract class AppRouter {
  // The first thing when creating routers is declaring routes variables
  static const kSignInView = '/signInView';
  static const kSignUpView = '/signUpView';
  static const onBoardingView = '/onBoardingView';
  static const kHomeView = '/homeView';
  static const kProfileView = '/profileView';

  // Then creating the router variable that = GoRouter"Contains a list of routes"
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const OnBoardingView();
        },
      )
    ],
  );
}
