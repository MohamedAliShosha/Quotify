import 'package:flutter/material.dart';
import 'package:starter_template/features/saved_quotes/presentation/widgets/saved_quotes_view_body.dart';

class SavedQuotesView extends StatelessWidget {
  const SavedQuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SavedQuotesViewBody(),
    );
  }
}
