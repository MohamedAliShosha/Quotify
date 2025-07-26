part of 'save_quotes_cubit.dart';

sealed class SaveQuotesState extends Equatable {
  const SaveQuotesState();

  @override
  List<Object> get props => [];
}

final class SaveQuotesInitial extends SaveQuotesState {}

final class SaveQuotesSuccess extends SaveQuotesState {}

final class SaveQuotesFailure extends SaveQuotesState {
  final String errorMessage;

  const SaveQuotesFailure(this.errorMessage);
}
