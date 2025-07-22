import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/features/Quotes/data/models/quote_model.dart';
import 'package:starter_template/features/Quotes/data/repos/quotes_repo.dart';

part 'quotes_state.dart';

class QuotesCubit extends Cubit<QuotesState> {
  QuotesCubit(this.quotesRepo) : super(QuotesInitial());

  final QuotesRepo quotesRepo;
  bool hasFetchedQuotes = false; // check if the quotes has already fetched

  Future<void> getQuotes() async {
    if (hasFetchedQuotes) {
      // if the quotes has already fetched once return nothing
      return;
    }
    emit(QuotesLoading());
    final result = await quotesRepo.fetchQuotes();
    result.fold(
      (failure) => emit(QuotesFailure(errorMessage: failure.errorMessage)),
      (quotes) {
        hasFetchedQuotes = true; // Mark as fetched
        emit(QuotesSuccess(quotes: quotes));
      },
    );
  }

  // This function has the same logic of the "getQuotes" one but without check fetching quotes because it role is to get quotes as it is a refresher
  Future<void> refreshQuotes() async {
    // This method is used when user pulls to refresh
    emit(QuotesLoading());
    final result = await quotesRepo.fetchQuotes();
    result.fold(
        (failure) => emit(QuotesFailure(errorMessage: failure.errorMessage)),
        (quotes) {
      emit(QuotesSuccess(quotes: quotes));
    });
  }
}
