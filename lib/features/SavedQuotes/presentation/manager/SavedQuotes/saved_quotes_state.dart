part of 'saved_quotes_cubit.dart';

sealed class SavedQuotesState extends Equatable {
  const SavedQuotesState();

  @override
  List<Object> get props => [];
}

final class SavedQuotesInitial extends SavedQuotesState {}
