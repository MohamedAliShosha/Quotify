import 'package:equatable/equatable.dart';

sealed class SaveQuoteState extends Equatable {
  const SaveQuoteState();

  @override
  List<Object> get props => [];
}

final class SaveQuoteInitial extends SaveQuoteState {}

final class SaveQuoteLoading extends SaveQuoteState {}

final class SaveQuoteSuccess extends SaveQuoteState {}

final class SaveQuoteFailure extends SaveQuoteState {
  final String errorMessage;
  const SaveQuoteFailure({required this.errorMessage});
}
