import 'package:flutter/material.dart';
import 'package:starter_template/features/auth/sign_up/presentation/widgets/already_have_account.dart';

import 'package:starter_template/features/auth/sign_up/presentation/widgets/sign_up_form.dart';
import 'package:starter_template/features/auth/login/presentation/widgets/custom_header_text.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

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
              text: 'Welcome to Quote!',
              fontSize: 24,
            ),
            SizedBox(height: 20),
            SignUpForm(), // ← The form you created earlier
            AlreadyHaveAccount(),
          ],
        ),
      ),
    );
  }
}
