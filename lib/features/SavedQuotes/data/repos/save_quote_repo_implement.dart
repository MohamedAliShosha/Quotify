import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:starter_template/core/errors/failures.dart';
import 'package:starter_template/core/utils/constants.dart';
import 'package:starter_template/features/SavedQuotes/data/models/saved_quotes_model.dart';
import 'package:starter_template/features/SavedQuotes/data/repos/save_quote_repo.dart';

class SaveQuoteRepoImplement implements SaveQuoteRepo {
  @override
  Future<Either<Failures, void>> saveQuote(
      {required SaveQuoteModel quote}) async {
    try {
      final box = await Hive.openBox<SaveQuoteModel>(
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

  // @override
  // Future<Either<Failures, List<SavedQuotesModel>>> getSavedQuotes() async {
  //   try {
  //     final box = await Hive.openBox<SavedQuotesModel>(
  //         Constants.kSavedQuotesBox); // This line is used to open the box
  //     final quotes = box.values.toList();
  //     return Right(
  //         quotes); // Return the list of saved quotes if the operation is successful
  //   } catch (e) {
  //     if (e is HiveError) {
  //       return Left(ServerFailure.fromHiveError(e));
  //     } else {
  //       return Left(ServerFailure('Unknown error: ${e.toString()}'));
  //     }
  //   }
  // }
}
