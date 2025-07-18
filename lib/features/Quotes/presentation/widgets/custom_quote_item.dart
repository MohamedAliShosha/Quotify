import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/app_styles.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

class CustomQuoteItem extends StatelessWidget {
  const CustomQuoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 8),
      decoration: BoxDecoration(
        color: ColorsManager.kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/quote.png',
                height: 24,
                width: 24,
              ),
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This is a test quote',
                style: AppStyles.styleBoldBlack18,
              ),
              SizedBox(
                height: 4,
              ),
              const Text(
                'This is the author of the quote',
                style: AppStyles.styleBoldGrey18,
              ),
            ],
          )
        ],
      ),
    );
  }
}
