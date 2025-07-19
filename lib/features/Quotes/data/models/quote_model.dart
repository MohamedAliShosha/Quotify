import 'package:equatable/equatable.dart';

class QuoteModel extends Equatable {
  final String? quote;
  final String? author;
  final String? c;
  final String? h;

  const QuoteModel({this.quote, this.author, this.c, this.h});

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        quote: json['q'] as String?,
        author: json['a'] as String?,
        c: json['c'] as String?,
        h: json['h'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'q': quote,
        'a': author,
        'c': c,
        'h': h,
      };

  @override
  List<Object?> get props => [quote, author, c, h];
}
