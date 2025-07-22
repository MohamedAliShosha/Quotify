import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/features/saved_quotes/presentation/manager/SaveQuote/save_quote_state.dart';

class SavedQuotesCubit extends Cubit<SaveQuoteState> {
  SavedQuotesCubit() : super(SaveQuoteInitial());

  void saveQuotes() async {
    emit(SaveQuoteLoading());
  }
}
