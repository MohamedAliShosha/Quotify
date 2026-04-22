import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quotes_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class QuotesModel extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'q')
  final String? quote;
  @HiveField(1)
  @JsonKey(name: 'a')
  final String? author;

  QuotesModel({required this.quote, required this.author});

  factory QuotesModel.fromJson(Map<String, dynamic> json) =>
      _$QuotesModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuotesModelToJson(this);
}
