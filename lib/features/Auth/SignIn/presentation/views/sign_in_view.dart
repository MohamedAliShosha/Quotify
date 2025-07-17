import 'package:flutter/material.dart';
import 'package:starter_template/features/Auth/SignIn/presentation/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Move the bloc provider from here to the SignInView that exists in AppRouter for better arch 
      body:  SignInViewBody(),
    );
  }
}
