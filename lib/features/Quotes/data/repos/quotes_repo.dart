import 'package:dartz/dartz.dart';
import 'package:starter_template/core/errors/failures.dart';
import 'package:starter_template/features/Quotes/data/models/quote_model.dart';

abstract class QuotesRepo {
  Future<Either<Failures, List<QuoteModel>>> getQuotes();
}
