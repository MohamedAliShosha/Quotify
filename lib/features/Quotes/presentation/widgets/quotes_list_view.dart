import 'package:flutter/material.dart';
import 'package:starter_template/features/Quotes/data/models/quote_model.dart';
import 'package:starter_template/features/Quotes/presentation/widgets/custom_quote_item.dart';

class QuotesListView extends StatelessWidget {
  const QuotesListView({
    super.key,
    required this.quotes,
  });

  final List<QuoteModel?> quotes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      itemCount: quotes.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final quote = quotes[index];

        return CustomQuoteItem(
          quoteModel: quote ??
              const QuoteModel(
                quote: 'Loading...',
                author: 'Loading...',
              ),
        );
      },
    );
  }
}
