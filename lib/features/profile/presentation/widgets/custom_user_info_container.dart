import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

class CustomUserInfoContainer extends StatelessWidget {
  const CustomUserInfoContainer({
    super.key,
    required this.text,
    required this.rightPadding,
    required this.leftPadding,
  });

  final String text;
  final double rightPadding;
  final double leftPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: rightPadding, left: leftPadding),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: ColorsManager.kWhiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600, // semibold
              color: ColorsManager.kBlackColor,
            ),
          ),
        ),
      ),
    );
  }
}
