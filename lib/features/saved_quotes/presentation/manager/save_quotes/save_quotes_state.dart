part of 'save_quotes_cubit.dart';

/// Base class for all save quote states
abstract class SaveQuotesState extends Equatable {
  const SaveQuotesState();

  @override
  List<Object?> get props => [];
}

/// Initial state (before any action)
class SaveQuotesInitial extends SaveQuotesState {}

/// State when saving a quote is successful
class SaveQuotesSuccess extends SaveQuotesState {}

/// State when the quote already exists in the box
class SaveQuotesAlreadyExists extends SaveQuotesState {}

/// State when any saving/deleting operation fails
class SaveQuotesFailure extends SaveQuotesState {
  final String error;
  const SaveQuotesFailure(this.error);

  @override
  List<Object?> get props => [error];
}

/// State when a quote is successfully deleted
class DeleteQuoteSuccess extends SaveQuotesState {}

/// State when deleting a quote fails (e.g., not found)
class DeleteQuoteFailure extends SaveQuotesState {
  final String error;
  const DeleteQuoteFailure(this.error);

  @override
  List<Object?> get props => [error];
}
