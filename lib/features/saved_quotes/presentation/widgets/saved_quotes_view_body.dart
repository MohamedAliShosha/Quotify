import 'package:flutter/material.dart';
import 'package:starter_template/features/saved_quotes/presentation/widgets/saved_quotes_list_view.dart';

class SavedQuotesViewBody extends StatefulWidget {
  const SavedQuotesViewBody({super.key});

  @override
  State<SavedQuotesViewBody> createState() => _SavedQuotesViewBodyState();
}

class _SavedQuotesViewBodyState extends State<SavedQuotesViewBody> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          //
          Expanded(
            child: SavedQuotesListView(),
          ),
        ],
      ),
    );
  }
}
