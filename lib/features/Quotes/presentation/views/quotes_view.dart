import 'package:flutter/material.dart';
import 'package:starter_template/features/quotes/presentation/widgets/quotes_view_body.dart';

class QuotesView extends StatelessWidget {
  const QuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: QuotesViewBody(),
    );
  }
}
