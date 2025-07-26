import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:starter_template/core/utils/constants.dart';
import 'package:starter_template/features/quotes/data/models/quotes_model.dart';
import 'package:starter_template/features/saved_quotes/presentation/manager/read_quotes/read_quotes_state.dart';

class ReadQuotesCubit extends Cubit<ReadQuotesState> {
  ReadQuotesCubit() : super(ReadQuotesInitial());

  void readAllQuotes() {
    var box = Hive.box<QuotesModel>(Constants.kSavedQuotesBox);
    List<QuotesModel> quotes = box.values.toList().reversed.toList();
    emit(ReadQuotesSuccess(quotes: quotes));
  }
}
