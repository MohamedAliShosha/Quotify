import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorsManager.kPrimaryColor,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                'Browse through inspiring quotes or add your own to share with others!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.kGreyColor,
                ),
              ),
            ),
            const SizedBox(height: 40),
            const CustomElevatedButton(),
            const SizedBox(height: 20),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Log event when button is pressed
        // Navigator.pushNamed(context, QuotesView.id);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding:
            const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
