part of 'quotes_cubit.dart';

sealed class QuotesState extends Equatable {
  const QuotesState();

  @override
  List<Object> get props => [];
}

final class QuotesInitial extends QuotesState {}

final class QuotesLoading extends QuotesState {}

final class QuotesSuccess extends QuotesState {
  final List<QuoteModel> quotes;

  const QuotesSuccess({required this.quotes});
}

final class QuotesFailure extends QuotesState {
  final String message;

  const QuotesFailure({required this.message});
}
