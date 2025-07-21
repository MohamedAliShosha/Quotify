import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/features/SavedQuotes/data/models/saved_quotes_model.dart';
import 'package:starter_template/features/SavedQuotes/data/repos/read_quotes_repo.dart';

part 'read_quote_state.dart';

class ReadQuoteCubit extends Cubit<ReadQuoteState> {
  ReadQuoteCubit(this.readQuotesRepo) : super(ReadQuoteLoading());

  final ReadQuotesRepo readQuotesRepo;

  Future<void> readSavedQuotes() async {
    emit(ReadQuoteLoading());
    final result = await readQuotesRepo.readSavedQuotes();
    result.fold(
      (failure) => emit(ReadQuoteFailure()),
      (quotes) => emit(ReadQuoteSuccess(quotes: quotes)),
    );
  }
}
