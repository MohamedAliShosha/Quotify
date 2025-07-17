import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

void showSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        backgroundColor: ColorsManager.kPrimaryColor,
        content: Center(
          child: Text(
            message,
            style: const TextStyle(
              color: ColorsManager.kBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
  );
}
