import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorsManager.kBlackColor,
      ),
      // width: 60,
      height: 60,
      child: Center(
        child: GestureDetector(
          onTap: () {},
          child: const Text(
            'Let\'s Go',
            style: TextStyle(
              color: ColorsManager.kWhiteColor,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
