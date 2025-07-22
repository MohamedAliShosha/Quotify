import 'package:flutter/material.dart';
import 'package:starter_template/features/SavedQuotes/presentation/widgets/save_quotes_view_body.dart';

class SaveQuotesView extends StatelessWidget {
  const SaveQuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SaveQuotesViewBody(),
    );
  }
}
