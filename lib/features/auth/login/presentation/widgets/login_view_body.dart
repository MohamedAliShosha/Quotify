import 'package:flutter/material.dart';
import 'package:starter_template/features/auth/sign_up/presentation/widgets/dont_have_account.dart';
import 'package:starter_template/features/auth/login/presentation/widgets/custom_header_text.dart';
import 'package:starter_template/features/auth/login/presentation/widgets/login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 200),
            CustomHeaderText(
              text: 'Hello,',
            ),
            CustomHeaderText(
              text: 'Welcome Back!',
              fontSize: 24,
            ),
            SizedBox(height: 20),
            LoginForm(),
            DontHaveAccount(),
          ],
        ),
      ),
    );
  }
}
