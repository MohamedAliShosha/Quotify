import 'package:flutter/material.dart';
import 'package:starter_template/core/functions/build_circular_rounded_rectangle_border.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      // () {
      //   // Log event when button is pressed
      //   // Navigator.pushNamed(context, QuotesView.id);
      // },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.kPrimaryColor,
        shape: buildCircularRoundedRectangleBorder(radius: 30),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      ),
      child: const Text(
        'Explore Quotes',
        style: TextStyle(
          color: ColorsManager.kBlackColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
