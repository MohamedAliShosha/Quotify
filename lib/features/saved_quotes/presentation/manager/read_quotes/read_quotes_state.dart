import 'package:starter_template/features/quotes/data/models/quotes_model.dart';

abstract class ReadQuotesState {}

class ReadQuotesInitial extends ReadQuotesState {}

class ReadQuotesLoading extends ReadQuotesState {}

class ReadQuotesSuccess extends ReadQuotesState {
  final List<QuotesModel> quotes;

  ReadQuotesSuccess({required this.quotes});
}

class ReadQuotesError extends ReadQuotesState {
  final String errorMessage;

  ReadQuotesError({required this.errorMessage});
}
