import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({
    super.key,
    required this.text,
    this.padding = const EdgeInsets.only(left: 8),
    this.fontSize = 20,
    this.fontFamily = 'Lato',
    this.color = ColorsManager.kPrimaryColor,
  });

  final String text;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final String fontFamily;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: 'Lato',
          color: color,
        ),
      ),
    );
  }
}
