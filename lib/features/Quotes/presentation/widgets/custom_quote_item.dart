import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/app_styles.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/features/quotes/data/models/quotes_model.dart';

class CustomQuoteItem extends StatelessWidget {
  const CustomQuoteItem({
    super.key,
    required this.quoteModel,
  });

  final QuotesModel quoteModel;

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
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/quote.png',
                  height: 24,
                  width: 24,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quoteModel.quote ?? 'There is No Quote Available Now',
                style: AppStyles.styleBoldBlack18,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    quoteModel.author ?? 'There is No Author Available',
                    style: AppStyles.styleBoldGrey18,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 12,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_border),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
