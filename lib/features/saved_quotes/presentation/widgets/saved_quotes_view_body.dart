import 'package:flutter/material.dart';
import 'package:starter_template/core/widgets/custom_app_bar.dart';
import 'package:starter_template/features/saved_quotes/presentation/widgets/saved_quotes_list_view.dart';

class SavedQuotesViewBody extends StatelessWidget {
  const SavedQuotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Your Quotes',
          ),
          Expanded(
            child: SavedQuotesListView(),
          ),
        ],
      ),
    );
  }
}
