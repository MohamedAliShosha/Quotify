import 'package:dartz/dartz.dart';
import 'package:starter_template/core/errors/failures.dart';
import 'package:starter_template/features/SavedQuotes/data/models/saved_quotes_model.dart';

abstract class ReadQuotesRepo {
  // // This method is used to get saved quotes
  Future<Either<Failures, List<SaveQuoteModel>>> readSavedQuotes();
}
