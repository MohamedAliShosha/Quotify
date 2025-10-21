import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/app_styles.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.buttonTitle,
    this.onTap,
    this.isLoading = false,
  });

  final String buttonTitle;
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24),
      child: IgnorePointer(
        ignoring: isLoading == true,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorsManager.kPrimaryColor,
          ),
          height: 60,
          child: Center(
            child: GestureDetector(
              onTap: onTap,
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: ColorsManager.kBlackColor,
                    )
                  : Text(
                      buttonTitle,
                      style: AppStyles.styleBoldPrimary24.copyWith(
                        color: ColorsManager.kBlackColor,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
