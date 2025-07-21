import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starter_template/features/SavedQuotes/data/models/saved_quotes_model.dart';

part 'saved_quotes_state.dart';

class SavedQuotesCubit extends Cubit<SavedQuotesState> {
  SavedQuotesCubit() : super(SavedQuotesInitial());
}
