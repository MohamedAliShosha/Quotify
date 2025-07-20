import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

import 'package:starter_template/features/Quotes/data/models/quote_model.dart';
import 'package:starter_template/features/Quotes/presentation/manager/quotes_cubit/quotes_cubit.dart';
import 'package:starter_template/features/Quotes/presentation/widgets/custom_quote_item.dart';

class QuotesViewBody extends StatefulWidget {
  const QuotesViewBody({super.key});

  @override
  State<QuotesViewBody> createState() => _QuotesViewBodyState();
}

class _QuotesViewBodyState extends State<QuotesViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<QuotesCubit>().getQuotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<QuotesCubit, QuotesState>(
        builder: (context, state) {
          final isLoading =
              state is QuotesLoading; // check if the state is loading

          // Either real data or skeleton placeholders
          // if the state is success display real quotes else display 6 dummy ones with null values
          final quotes = state is QuotesSuccess
              ? state.quotes
              : List.generate(6, (_) => null);

          return Skeletonizer(
            enabled:
                isLoading, // if isLoading is true the Skeletonizer will be activated
            child: RefreshIndicator(
              color: ColorsManager.kPrimaryColor,
              backgroundColor: ColorsManager.kBlackColor,
              onRefresh: () => context.read<QuotesCubit>().refreshQuotes(),
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
