import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/core/widgets/custom_button.dart';
import 'package:starter_template/features/OnBoarding/presentation/widgets/custom_animated_opacity.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({
    super.key,
    required bool isVisible,
  }) : _isVisible = isVisible;

  final bool _isVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          CustomAnimatedOpacity(
            isVisible: _isVisible,
            durationInSeconds: 2,
            child: Image.asset(
              'assets/images/quote.png',
              height: 40,
              width: 40,
            ),
          ),
          const SizedBox(
            height: 65,
          ),
          CustomAnimatedOpacity(
            isVisible: _isVisible,
            durationInSeconds: 2,
            child: const Text(
              'Get',
              style: TextStyle(
                height: .5,
                fontSize: 50,
                color: ColorsManager.kPrimaryColor,
                
              ),
            ),
          ),
          CustomAnimatedOpacity(
            isVisible: _isVisible,
            durationInSeconds: 3,
            child: const Text(
              'Inspired',
              style: TextStyle(
                color: ColorsManager.kPrimaryColor,
                fontSize: 50, // responsive font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          const SizedBox(
            width: double.infinity,
          ),
          CustomAnimatedOpacity(
            isVisible: _isVisible,
            durationInSeconds: 3,
            child: const CustomButton(
              buttonTitle: 'Get Started',
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
