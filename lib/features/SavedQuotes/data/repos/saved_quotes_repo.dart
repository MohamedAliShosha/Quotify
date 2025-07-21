import 'package:dartz/dartz.dart';
import 'package:starter_template/core/errors/failures.dart';
import 'package:starter_template/features/SavedQuotes/data/models/saved_quotes_model.dart';

abstract class SavedQuotesRepo {
  // This method is used to save quote to database
  Future<void> saveQuote({required SavedQuotesModel savedQuotesModel});
  // This method is used to get saved quotes
  Future<Either<Failures, List<SavedQuotesModel>>> getSavedQuotes();
}
