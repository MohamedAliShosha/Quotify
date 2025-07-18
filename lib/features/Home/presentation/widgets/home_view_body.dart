import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/app_styles.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

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
        const Padding(
          padding: EdgeInsets.only(top: 200, right: 50, left: 50),
        ),
        // const SizedBox(height: 20),
        //
      ],
    );
  }
}
