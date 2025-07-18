import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

abstract class AppStyles {
  static const styleBoldBlack18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ColorsManager.kBlackColor,
  );
  static const styleBoldGrey18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ColorsManager.kGreyColor,
  );
  static const styleBoldGrey16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: ColorsManager.kGreyColor,
  );
  static const styleBoldPrimary24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ColorsManager.kPrimaryColor,
  );
}
