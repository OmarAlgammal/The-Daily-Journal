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
      description: '',
      content: '',
      url: '',
      imageUrl: '',
      publishedDate: DateTime.now(),
    );
  }

  @override
  void write(BinaryWriter writer, NewsModel obj) {
    writer
      ..writeByte(6)
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
      ..write(obj.title);
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

final random = Random();

_$_News _$$_NewsFromJson(Map<String, dynamic> json) {
  return _$_News(
    sourceName: json['source']['name'] ?? '',
    sourceLogoUrl: getAgencyLogoUrl(),
    category: getCategory(),
    authorName: json['author'] ?? 'unavailable',
    authorImageUrl: getAuthorImageUrl(),
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    content: json['content'] ?? '',
    url: json['url'] ?? '',
    imageUrl: json['urlToImage'] ?? '',
    publishedDate: DateTime.parse(json['publishedAt'] ?? ''),
  );
}

Map<String, dynamic> _$$_NewsToJson(_$_News instance) => <String, dynamic>{
      'sourceName': instance.sourceName,
      'sourceLogoUrl': instance.sourceLogoUrl,
      'category': instance.category,
      'authorName': instance.authorName,
      'authorImageUrl': instance.authorImageUrl,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'publishedDate': instance.publishedDate.toIso8601String(),
    };

String getAgencyLogoUrl() {
  final list = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/CNN_International_logo.svg/1200px-CNN_International_logo.svg.png',
    'https://logos-world.net/wp-content/uploads/2023/01/The-Wall-Street-Journal-Symbol.png',
    'https://logos-world.net/wp-content/uploads/2020/11/The-New-York-Times-Emblem.png',
    'https://w7.pngwing.com/pngs/23/563/png-transparent-the-washington-post-justice-policy-institute-journalism-app-store-news-post-miscellaneous-angle-text.png',
    'https://xinhuamyanmar.com/wp-content/uploads/2021/05/xinhua-fav-1.png',
    'https://data.bloomberglp.com/company/sites/51/2019/08/og-image-generic-lp.png',
    'https://www.spa.gov.sa/include/images/logo.png',
    'https://yt3.googleusercontent.com/rCC82h_2oL41BY6w2OGgOn3TlaqY6SLdw3bLHSH-Auyl9ehOIz0Fqela3hFFA887KZ3YHhZl3U4=s900-c-k-c0x00ffffff-no-rj',
  ];
  return list[random.nextInt(list.length)];
}

String getAuthorImageUrl() {
  final list = [
    'https://media.istockphoto.com/id/451301213/photo/here-on-the-scene.jpg?s=612x612&w=0&k=20&c=zoRK_dn88ra9UYsoO0Q_kKMLqDm0Nbag0Mb41CEAQa4=',
    'https://www.shutterstock.com/image-photo/handsome-man-beard-holding-reporter-260nw-2076386344.jpg',
    'https://storage.googleapis.com/cdn.paydesk.co/img/335/kapil.kajal.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBbibMsUe9L5RMXfMMnoucx9tgjp0b2bj37Q&usqp=CAU',
    'https://www.shutterstock.com/image-photo/handsome-hispanic-man-holding-reporter-260nw-1937926225.jpg',
    'https://www.shutterstock.com/image-photo/male-journalist-microphone-on-white-260nw-1670708191.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJdkeRlxVAPzHgt77DrQ7TPS0bplJvpEXytA&usqp=CAU',
  ];
  return list[random.nextInt(list.length)];
}

String getCategory() {
  final list = [
    'Business',
    'Entertainment',
    'Science',
    'Sports',
    'Health',
    'Technology',
    'General',
  ];
  return list[random.nextInt(list.length)];
}
