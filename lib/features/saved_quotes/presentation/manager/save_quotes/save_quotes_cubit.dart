import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:starter_template/core/utils/constants.dart';
import 'package:starter_template/features/quotes/data/models/quotes_model.dart';

part 'save_quotes_state.dart';

class SaveQuotesCubit extends Cubit<SaveQuotesState> {
  SaveQuotesCubit() : super(SaveQuotesInitial());

  void saveQuotes(QuotesModel quote) async {
    try {
      var box = Hive.box<QuotesModel>(Constants.kSavedQuotesBox);
      await box.add(quote);
      emit(SaveQuotesSuccess());
    } catch (e) {
      emit(SaveQuotesFailure(e.toString()));
    }
  }
}
