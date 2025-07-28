import 'package:flutter/material.dart';
import 'package:starter_template/features/auth/SignIn/presentation/widgets/custom_redirect_button.dart';
import 'package:starter_template/features/auth/SignIn/presentation/widgets/custom_redirect_text.dart';

class CustomRedirectRow extends StatelessWidget {
  const CustomRedirectRow({
    super.key,
    required this.redirectText,
    required this.redirectButtonText,
  });

  final String redirectText;
  final String redirectButtonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomRedirectText(
          redirectText: redirectText,
        ),
        CustomRedirectButton(
          onTap: () {
            Navigator.pop(context);
          },
          redirectButtonText: redirectButtonText,
        ),
      ],
    );
  }
}
