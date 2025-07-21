// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_quotes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedQuotesModelAdapter extends TypeAdapter<SaveQuoteModel> {
  @override
  final int typeId = 0;

  @override
  SaveQuoteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveQuoteModel(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SaveQuoteModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.quote)
      ..writeByte(1)
      ..write(obj.author);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedQuotesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
