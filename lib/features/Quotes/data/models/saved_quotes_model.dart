import 'package:hive/hive.dart';

part 'saved_quotes_model.g.dart';

@HiveType(typeId: 0)
class SavedQuotesModel extends HiveObject {
  @HiveField(0)
  final String quote;

  @HiveField(1)
  final String author;

  SavedQuotesModel(this.quote, this.author);
}
