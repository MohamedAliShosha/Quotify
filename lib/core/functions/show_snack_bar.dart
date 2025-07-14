import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorsManager.kPrimaryColor,
      content: Text(message),
    ),
  );
}
