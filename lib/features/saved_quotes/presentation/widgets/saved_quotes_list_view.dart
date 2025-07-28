import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/features/quotes/data/models/quotes_model.dart';
import 'package:starter_template/features/saved_quotes/presentation/manager/read_quotes/read_quotes_cubit.dart';
import 'package:starter_template/features/saved_quotes/presentation/manager/read_quotes/read_quotes_state.dart';
import 'package:starter_template/features/saved_quotes/presentation/widgets/custom_saved_quotes_item.dart';

class SavedQuotesListView extends StatelessWidget {
  const SavedQuotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadQuotesCubit, ReadQuotesState>(
      builder: (context, state) {
        if (state is ReadQuotesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ReadQuotesError) {
          print(state.errorMessage);
          return Center(child: Text(state.errorMessage));
        } else if (state is ReadQuotesSuccess) {
          List<QuotesModel> quotes = state.quotes;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: quotes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CustomSavedQuotesItem(quoteModel: quotes[index]),
              ),
            ),
          );
        }
        return const Center(child: Text('No quotes available.'));
      },
    );
  }
}
