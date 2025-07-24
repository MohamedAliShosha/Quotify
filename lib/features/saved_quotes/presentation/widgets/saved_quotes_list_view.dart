import 'package:flutter/material.dart';
import 'package:starter_template/features/quotes/data/models/quotes_model.dart';
import 'package:starter_template/features/quotes/presentation/widgets/custom_quote_item.dart';

class SavedQuotesListView extends StatelessWidget {
  const SavedQuotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          child: CustomQuoteItem(
            quoteModel: QuotesModel(
                quote: 'quote',
                author: 'author'), // will be replaced with quotes[index]
          ),
        ),
      ),
    );
  }
}
