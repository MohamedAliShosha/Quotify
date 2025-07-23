import 'package:dartz/dartz.dart';
import 'package:starter_template/core/errors/failures.dart';
import 'package:starter_template/features/quotes/data/models/quotes_model.dart';

abstract class SaveQuoteRepo {
  // This method is used to save quote to database
  Future<Either<Failures, void>> saveQuote({required QuotesModel quote});
}
