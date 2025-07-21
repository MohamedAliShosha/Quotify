part of 'saved_quotes_cubit.dart';

sealed class SavedQuotesState extends Equatable {
  const SavedQuotesState();

  @override
  List<Object> get props => [];
}

final class SavedQuotesInitial extends SavedQuotesState {}

final class SavedQuotesLoading extends SavedQuotesState {}

final class SavedQuotesSuccess extends SavedQuotesState {
  final List<SavedQuotesModel> quotes;
  const SavedQuotesSuccess({required this.quotes});
}

final class SavedQuotesFailure extends SavedQuotesState {
  final String errorMessage;
  const SavedQuotesFailure({required this.errorMessage});
}
