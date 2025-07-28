import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.title, this.icon, this.onPressed});

  final String? title;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title!,
          style:
              const TextStyle(fontSize: 28, color: ColorsManager.kWhiteColor),
        ),
        // const Spacer(),
        // CustomIcon(
        //   onPressed: onPressed,
        //   icon: icon,
        // ),
      ],
    );
  }
}
