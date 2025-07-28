import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/core/functions/show_snack_bar.dart';
import 'package:starter_template/core/utils/app_styles.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/features/quotes/data/models/quotes_model.dart';
import 'package:starter_template/features/saved_quotes/presentation/manager/read_quotes/read_quotes_cubit.dart';
import 'package:starter_template/features/saved_quotes/presentation/manager/save_quotes/save_quotes_cubit.dart';

class CustomQuoteItem extends StatefulWidget {
  const CustomQuoteItem({
    super.key,
    required this.quoteModel,
  });

  final QuotesModel quoteModel;

  @override
  State<CustomQuoteItem> createState() => _CustomQuoteItemState();
}

class _CustomQuoteItemState extends State<CustomQuoteItem> {
  bool isSaved = false;

  void toggleSave() {
    if (!isSaved) {
      BlocProvider.of<SaveQuotesCubit>(context).saveQuotes(widget.quoteModel);
      showSnackBar(context, message: 'Quote Saved Successfully!');
      BlocProvider.of<ReadQuotesCubit>(context).readAllQuotes();
      setState(() {
        isSaved = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 8),
      decoration: BoxDecoration(
        color: ColorsManager.kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/quote.png',
                  height: 24,
                  width: 24,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.quoteModel.quote ?? 'There is No Quote Available Now',
                style: AppStyles.styleBoldBlack18,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    widget.quoteModel.author ?? 'There is No Author Available',
                    style: AppStyles.styleBoldGrey18,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: IconButton(
                      onPressed: toggleSave,
                      icon: isSaved
                          ? const Icon(Icons.bookmark)
                          : const Icon(Icons.bookmark_border),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
