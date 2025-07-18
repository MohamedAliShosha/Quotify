import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

class CustomQuoteItem extends StatelessWidget {
  const CustomQuoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
      decoration: BoxDecoration(
        color: ColorsManager.kQuoteItemColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/quote.png',
                height: 24,
                width: 24,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18),
            child: Column(
              children: [
                Text(
                  'This is a test quote',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'This is the author of the quote',
                  style: TextStyle(
                    color: ColorsManager.kGreyColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
