import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

class CustomProfileCircleAvatar extends StatelessWidget {
  const CustomProfileCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        backgroundColor: ColorsManager.kWhiteColor,
        radius: 50,
        child: Icon(
          Icons.person,
          color: ColorsManager.kBlackColor,
          size: 100,
        ),
      ),
    );
  }
}
