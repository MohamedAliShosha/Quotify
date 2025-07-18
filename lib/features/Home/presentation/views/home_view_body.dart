import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_template/core/utils/app_router.dart';
import 'package:starter_template/core/utils/app_styles.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/core/widgets/custom_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/images/quote.png',
              color: ColorsManager.kPrimaryColor,
              fit: BoxFit.contain,
              width: 200,
              height: 200,
            ),
          ),
        ),
        const Text(
          'Discover Your Favorite Quotes!',
          textAlign: TextAlign.center,
          style: AppStyles.styleBoldPrimary24,
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            'Browse through inspiring quotes or add your own to share with others!',
            textAlign: TextAlign.center,
            style: AppStyles.styleBoldGrey16,
          ),
        ),
        // const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(top: 100, right: 50, left: 50),
          child: CustomButton(
            buttonTitle: 'Explore Quotes!',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kQuotesView);
            },
          ),
        ),
        // const SizedBox(height: 20),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }
}
