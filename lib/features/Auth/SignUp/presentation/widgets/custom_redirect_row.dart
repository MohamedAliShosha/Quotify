import 'package:flutter/material.dart';
import 'package:starter_template/features/auth/sign_in/presentation/widgets/custom_redirect_button.dart';
import 'package:starter_template/features/auth/sign_in/presentation/widgets/custom_redirect_text.dart';

class CustomRedirectRow extends StatelessWidget {
  const CustomRedirectRow({
    super.key,
    required this.onTap,
    required this.redirectText,
    required this.redirectButtonText,
  });

  final String redirectText;
  final String redirectButtonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomRedirectText(
          redirectText: redirectText,
        ),
        CustomRedirectButton(
          onTap: onTap,
          redirectButtonText: redirectButtonText,
        ),
      ],
    );
  }
}
