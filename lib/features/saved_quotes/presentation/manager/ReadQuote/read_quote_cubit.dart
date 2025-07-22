import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'read_quote_state.dart';

class ReadQuoteCubit extends Cubit<ReadQuoteState> {
  ReadQuoteCubit() : super(ReadQuoteLoading());

  Future<void> readSavedQuotes() async {}
}
