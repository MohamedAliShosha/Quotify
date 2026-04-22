import 'package:flutter/material.dart';
import '../../data/models/quotes_model.dart';
import 'custom_quote_item.dart';

class FetchedQuotesListView extends StatelessWidget {
  const FetchedQuotesListView({
    super.key,
    required this.quotes,
  });

  final List<QuotesModel?> quotes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      itemCount: quotes.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final quote = quotes[index];

        return CustomQuoteItem(
            quoteModel:
                quote ?? QuotesModel(quote: 'Loading', author: 'Loading'));
      },
    );
  }
}
