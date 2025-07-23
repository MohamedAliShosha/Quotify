import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:starter_template/core/errors/failures.dart';
import 'package:starter_template/core/utils/constants.dart';
import 'package:starter_template/features/quotes/data/models/quotes_model.dart';
import 'package:starter_template/features/saved_quotes/data/repos/save_quote_repo.dart';

class SaveQuoteRepoImplement implements SaveQuoteRepo {
  @override
  Future<Either<Failures, void>> saveQuote(
      {required QuotesModel quote}) async {
    try {
      final box = await Hive.openBox<QuotesModel>(
          Constants.kSavedQuotesBox); // This line is used to open the box
      await box.add(quote);
    } catch (e) {
      if (e is HiveError) {
        return Left(ServerFailure.fromHiveError(e));
      } else {
        return Left(ServerFailure('Unknown error: ${e.toString()}'));
      }
    }
    return const Right(
        null); // Return null if the operation is successful and the quote is saved
  }
}
