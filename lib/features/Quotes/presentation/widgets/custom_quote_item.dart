import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/core/functions/show_snack_bar.dart';
import 'package:starter_template/core/utils/app_styles.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/features/quotes/data/models/quotes_model.dart';
import 'package:starter_template/features/saved_quotes/presentation/manager/read_quotes/read_quotes_cubit.dart';
import 'package:starter_template/features/saved_quotes/presentation/manager/save_quotes/save_quotes_cubit.dart';

/// A custom widget to display a single quote card
/// It allows saving/unsaving the quote using a bookmark icon.
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
  /// Track whether the current quote is saved or not
  bool isSaved = false;

  @override
  void initState() {
    super.initState();

    // Check the initial save state of the quote when the widget is built
    final saveCubit = BlocProvider.of<SaveQuotesCubit>(context);
    isSaved = saveCubit.isQuoteSaved(widget.quoteModel);
  }

  /// Handle saving or unsaving a quote when the icon is tapped
  void toggleSave() async {
    final saveCubit = BlocProvider.of<SaveQuotesCubit>(context);
    final readCubit = BlocProvider.of<ReadQuotesCubit>(context);

    // If already saved → delete it
    if (isSaved) {
      await saveCubit.deleteQuote(widget.quoteModel);
      showSnackBar(context, message: 'Quote removed from saved!');
    }
    // Otherwise → save it
    else {
      await saveCubit.saveQuotes(widget.quoteModel);
      showSnackBar(context, message: 'Quote saved successfully!');
    }

    // Refresh saved quotes list (to update Saved Quotes screen)
    readCubit.readAllQuotes();

    // Update UI immediately
    setState(() {
      isSaved = !isSaved;
    });
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
          /// Quote icon at the top
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

          /// Quote text, author name, and save icon
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Quote text
              Text(
                widget.quoteModel.quote ?? 'There is No Quote Available Now',
                style: AppStyles.styleBoldBlack18,
              ),

              const SizedBox(height: 4),

              /// Author + Bookmark icon row
              Row(
                children: [
                  /// Author name
                  Text(
                    widget.quoteModel.author ?? 'There is No Author Available',
                    style: AppStyles.styleBoldGrey18,
                  ),
                  const Spacer(),

                  /// Save / Unsave icon
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: IconButton(
                      onPressed: toggleSave,
                      icon: Icon(
                        isSaved ? Icons.bookmark : Icons.bookmark_border,
                      ),
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
