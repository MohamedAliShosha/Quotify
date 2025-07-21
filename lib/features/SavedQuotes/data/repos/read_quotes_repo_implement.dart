import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:starter_template/core/errors/failures.dart';
import 'package:starter_template/core/utils/constants.dart';
import 'package:starter_template/features/SavedQuotes/data/models/saved_quotes_model.dart';
import 'package:starter_template/features/SavedQuotes/data/repos/read_quotes_repo.dart';

class ReadQuotesRepoImplement implements ReadQuotesRepo {
  @override
  Future<Either<Failures, List<SaveQuoteModel>>> readSavedQuotes() async {
    try {
      final box = await Hive.openBox<SaveQuoteModel>(
          Constants.kSavedQuotesBox); // This line is used to open the box
      final quotes = box.values.toList();
      return Right(
          quotes); // Return the list of saved quotes if the operation is successful
    } catch (e) {
      if (e is HiveError) {
        return Left(ServerFailure.fromHiveError(e));
      } else {
        return Left(ServerFailure('Unknown error: ${e.toString()}'));
      }
    }
  }
}
