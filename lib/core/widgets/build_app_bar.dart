import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context,
    {Widget? leadingWidget,
    Color? backgroundColor,
    Color? foregroundColor,
    String? title,
    Color? titleColor,
    double? elevation,
    FontWeight? fontWeight,
    bool? centerTitle}) {
  return AppBar(
    title: Text(
      title ?? '',
      style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.bold,
          color: titleColor ?? Colors.black),
    ),
    elevation: elevation ?? 0,
    centerTitle: centerTitle ?? false,
    leading: leadingWidget,
    backgroundColor: backgroundColor ?? Colors.white,
    foregroundColor: foregroundColor ?? Colors.black,
    surfaceTintColor: Colors.transparent, // ✅ disable Material 3 tinting
  );
}
