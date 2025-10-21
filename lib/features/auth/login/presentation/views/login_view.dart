import 'package:flutter/material.dart';
import 'package:starter_template/features/auth/login/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset:
          true, // to avoid the keyboard from overlapping the text fields
      // Move the bloc provider from here to the SignInView that exists in AppRouter for better arch
      body: SafeArea(
        child: LoginViewBody(),
      ),
    );
  }
}
