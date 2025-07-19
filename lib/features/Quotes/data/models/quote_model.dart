import 'package:equatable/equatable.dart';

class QuoteModel extends Equatable {
  final String? quote;
  final String? author;

  const QuoteModel({this.quote, this.author});

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        quote: json['q'] as String?,
        author: json['a'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'q': quote,
        'a': author,
      };

  @override
  List<Object?> get props => [quote, author];
}
