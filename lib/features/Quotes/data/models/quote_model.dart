import 'package:equatable/equatable.dart';

class QuotesModel extends Equatable {
  final String? quote;
  final String? author;

  const QuotesModel({this.quote, this.author});

  factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
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
