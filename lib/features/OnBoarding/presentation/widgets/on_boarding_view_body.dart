import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_template/core/utils/app_router.dart';
import 'package:starter_template/core/utils/app_styles.dart';
import 'package:starter_template/core/widgets/custom_button.dart';
import 'package:starter_template/features/onboarding/presentation/widgets/custom_animated_opacity.dart';

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
            child: Text(
              'Get',
              style: AppStyles.styleBoldPrimary24.copyWith(
                fontSize: 50,
                height: .5,
              ),
            ),
          ),
          CustomAnimatedOpacity(
            isVisible: _isVisible,
            durationInSeconds: 3,
            child: Text(
              'Inspired',
              style: AppStyles.styleBoldPrimary24.copyWith(
                fontSize: 50,
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
            child: CustomButton(
              buttonTitle: 'Get Started',
              onTap: () => GoRouter.of(context).push(AppRouter.kSignInView),
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
