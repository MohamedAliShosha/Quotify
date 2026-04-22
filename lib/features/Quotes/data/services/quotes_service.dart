import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/quotes_model.dart';
import '../../../../core/utils/constants.dart';

part 'quotes_service.g.dart';

@RestApi(baseUrl: Constants.quotesBaseUrl)
abstract class QuotesService {
  factory QuotesService(Dio dio, {String? baseUrl}) = _QuotesService;

  @GET('/quotes')
  Future<List<QuotesModel>> getQuotes();
}
