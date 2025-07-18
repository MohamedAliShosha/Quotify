import 'package:flutter/material.dart';
import 'package:starter_template/features/Quotes/presentation/widgets/custom_quote_item.dart';

class QuotesViewBody extends StatelessWidget {
  const QuotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CustomQuoteItem();
      },
    );
  }
}
