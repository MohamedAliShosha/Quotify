import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.buttonTitle,
  });

  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorsManager.kPrimaryColor,
      ),
      // width: 60,
      height: 60,
      child: Center(
        child: GestureDetector(
          onTap: () {},
          child:  Text(
            buttonTitle,
            style: const TextStyle(
              color: ColorsManager.kBlackColor,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
