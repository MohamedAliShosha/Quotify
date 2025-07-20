import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:starter_template/core/errors/failures.dart';
import 'package:starter_template/core/utils/api_service.dart';
import 'package:starter_template/features/Quotes/data/models/quote_model.dart';
import 'package:starter_template/features/Quotes/data/repos/quotes_repo.dart';

class QuotesRepoImplement implements QuotesRepo {
  final ApiServices apiServices;

  QuotesRepoImplement(this.apiServices);
  @override
  Future<Either<Failures, List<QuoteModel>>> getQuotes() async {
    try {
      // I used a quotes variable directly not using final data = await apiServices.get(endPoint: 'quotes') then assigning the data to a new variable called quotes because the response has only quotes not other items
      final data = await apiServices.get(endPoint: 'quotes');
      final quotesList = data.map((item) => QuoteModel.fromJson(item)).toList();

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
