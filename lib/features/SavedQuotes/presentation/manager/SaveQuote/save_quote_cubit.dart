import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/features/SavedQuotes/data/models/saved_quotes_model.dart';
import 'package:starter_template/features/SavedQuotes/data/repos/save_quote_repo.dart';
import 'package:starter_template/features/SavedQuotes/presentation/manager/SaveQuote/save_quote_state.dart';

class SavedQuotesCubit extends Cubit<SaveQuoteState> {
  SavedQuotesCubit(this.savedQuotesRepo) : super(SaveQuoteInitial());

  final SaveQuoteRepo savedQuotesRepo;

  Future<void> saveQuotes(SaveQuoteModel quote) async {
    emit(SaveQuoteLoading());
    final result = await savedQuotesRepo.saveQuote(quote: quote);
    result.fold((failure) {
      emit(SaveQuoteFailure(errorMessage: failure.errorMessage));
    }, (_) {
      emit(SaveQuoteSuccess());
    });
  }
}
