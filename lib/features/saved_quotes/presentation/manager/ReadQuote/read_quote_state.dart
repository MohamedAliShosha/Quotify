part of 'read_quote_cubit.dart';

sealed class ReadQuoteState extends Equatable {
  const ReadQuoteState();

  @override
  List<Object> get props => [];
}

final class ReadQuoteInitial extends ReadQuoteState {}

final class ReadQuoteLoading extends ReadQuoteState {}

final class ReadQuoteSuccess extends ReadQuoteState {}

final class ReadQuoteFailure extends ReadQuoteState {}
