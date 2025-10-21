import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:starter_template/core/utils/constants.dart';
import 'package:starter_template/features/quotes/data/models/quotes_model.dart';

part 'save_quotes_state.dart';

/// Cubit that manages saving and deleting quotes from Hive storage
class SaveQuotesCubit extends Cubit<SaveQuotesState> {
  SaveQuotesCubit() : super(SaveQuotesInitial());

  /// Save a quote to Hive
  Future<void> saveQuotes(QuotesModel quote) async {
    try {
      // Open the saved quotes box
      final box = Hive.box<QuotesModel>(Constants.kSavedQuotesBox);

      // Prevent adding duplicate quotes (based on quote text)
      final exists = box.values.any((q) => q.quote == quote.quote);
      if (exists) {
        emit(SaveQuotesAlreadyExists());
        return;
      }

      // Add the quote to the box
      await box.add(quote);
      emit(SaveQuotesSuccess());
    } catch (e) {
      emit(SaveQuotesFailure(e.toString()));
    }
  }

  /// Delete a quote from Hive if it exists
  Future<void> deleteQuote(QuotesModel quote) async {
    try {
      final box = Hive.box<QuotesModel>(Constants.kSavedQuotesBox);

      // Find the Hive key for the quote we want to delete
      final keyToDelete = box.keys.firstWhere(
        (key) => box.get(key)?.quote == quote.quote,
        orElse: () => null,
      );

      // If found, delete it
      if (keyToDelete != null) {
        await box.delete(keyToDelete);
        emit(DeleteQuoteSuccess());
      } else {
        emit(const DeleteQuoteFailure('Quote not found'));
      }
    } catch (e) {
      emit(SaveQuotesFailure(e.toString()));
    }
  }

  /// Check if a quote already exists in Hive
  bool isQuoteSaved(QuotesModel quote) {
    final box = Hive.box<QuotesModel>(Constants.kSavedQuotesBox);
    return box.values.any((q) => q.quote == quote.quote);
  }
}
