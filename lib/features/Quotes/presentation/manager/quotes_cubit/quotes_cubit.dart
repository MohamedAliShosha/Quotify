import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starter_template/features/Quotes/data/models/quote_model.dart';
import 'package:starter_template/features/Quotes/data/repos/quotes_repo.dart';

part 'quotes_state.dart';

class QuotesCubit extends Cubit<QuotesState> {
  QuotesCubit(this.quotesRepo) : super(QuotesInitial());

  final QuotesRepo quotesRepo;

  Future<void> getQuotes() async {
    emit(QuotesLoading());
    final result = await quotesRepo.getQuotes();
    result.fold(
      (failure) => emit(QuotesFailure(message: failure.errorMessage)),
      (quotes) => emit(QuotesSuccess(quotes: quotes)),
    );
  }
}
