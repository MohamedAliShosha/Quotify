import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/features/quotes/data/models/quotes_model.dart';
import 'package:starter_template/features/saved_quotes/data/repos/save_quote_repo.dart';
import 'package:starter_template/features/saved_quotes/presentation/manager/save_quote/save_quote_state.dart';

class SavedQuotesCubit extends Cubit<SaveQuoteState> {
  SavedQuotesCubit(this.saveQuoteRepo) : super(SaveQuoteInitial());

  final SaveQuoteRepo saveQuoteRepo;

  Future<void> saveQuotes({required QuotesModel quote}) async {
    emit(SaveQuoteLoading());
    try {
      await saveQuoteRepo.saveQuote(quote: quote);
      emit(SaveQuoteSuccess());
    } catch (e) {
      emit(
        SaveQuoteFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
