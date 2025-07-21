import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saved_quotes_state.dart';

class SavedQuotesCubit extends Cubit<SavedQuotesState> {
  SavedQuotesCubit() : super(SavedQuotesInitial());
}
