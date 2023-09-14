// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsModelAdapter extends TypeAdapter<NewsModel> {
  @override
  final int typeId = 0;

  @override
  NewsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsModel(
      sourceName: fields[0] as String,
      sourceLogoUrl: fields[1] as String,
      category: fields[2] as String,
      authorName: fields[3] as String,
      authorImageUrl: fields[4] as String,
      title: fields[5] as String,
      description: fields[6] as String,
      content: fields[7] as String,
      url: fields[8] as String,
      imageUrl: fields[9] as String,
      publishedDate: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, NewsModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.sourceName)
      ..writeByte(1)
      ..write(obj.sourceLogoUrl)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.authorName)
      ..writeByte(4)
      ..write(obj.authorImageUrl)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.content)
      ..writeByte(8)
      ..write(obj.url)
      ..writeByte(9)
      ..write(obj.imageUrl)
      ..writeByte(10)
      ..write(obj.publishedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
