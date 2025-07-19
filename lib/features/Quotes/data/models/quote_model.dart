import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String? quote;
  final String? author;
  final String? c;
  final String? h;

  const Quote({this.quote, this.author, this.c, this.h});

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
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
