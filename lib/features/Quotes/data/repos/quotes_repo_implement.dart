import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../services/quotes_service.dart';
import '../models/quotes_model.dart';
import 'quotes_repo.dart';

class QuotesRepoImplement implements QuotesRepo {
  final QuotesService quotesService;

  QuotesRepoImplement(this.quotesService);
  @override
  Future<Either<Failures, List<QuotesModel>>> fetchQuotes() async {
    try {
      final quotesList = await quotesService.getQuotes();

      return Right(quotesList);
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromDioError(error),
        );
      }
      return Left(
        ServerFailure(
          error.toString(),
        ),
      );
    }
  }
}
