import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

class CustomRedirectButton extends StatelessWidget {
  const CustomRedirectButton({
    super.key,
    this.onTap,
    required this.redirectText,
  });

  final void Function()? onTap;
  final String redirectText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        redirectText,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorsManager.kPrimaryColor,
        ),
      ),
    );
  }
}
