import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../models/quotes_model.dart';
import 'quotes_repo.dart';

class QuotesRepoImplement implements QuotesRepo {
  final ApiServices apiServices;

  QuotesRepoImplement(this.apiServices);
  @override
  Future<Either<Failures, List<QuotesModel>>> fetchQuotes() async {
    try {
      // I used a quotes variable directly not using final data = await apiServices.get(endPoint: 'quotes') then assigning the data to a new variable called quotes because the response has only quotes not other items
      final data = await apiServices.get(endPoint: 'quotes');
      final quotesList =
          data.map((item) => QuotesModel.fromJson(item)).toList();

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
