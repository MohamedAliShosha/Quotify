import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

class CustomRedirectText extends StatelessWidget {
  const CustomRedirectText({
    super.key, required this.redirectText,
  });

  final String redirectText;


  @override
  Widget build(BuildContext context) {
    return  Text(
      redirectText,
      style: const TextStyle(
        color: ColorsManager.kPrimaryColor,
      ),
    );
  }
}

