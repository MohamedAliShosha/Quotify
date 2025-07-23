import 'package:hive_flutter/hive_flutter.dart';

part 'quotes_model.g.dart';

@HiveType(typeId: 0)
class QuotesModel extends HiveObject {
  @HiveField(0)
  final String? quote;
  @HiveField(1)
  final String? author;

  QuotesModel({required this.quote, required this.author});

  factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
        quote: json['q'] as String?,
        author: json['a'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'q': quote,
        'a': author,
      };
}
