import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/quotes_model.dart';

abstract class QuotesRepo {
  Future<Either<Failures, List<QuotesModel>>> fetchQuotes();
}
