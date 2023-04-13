// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_News _$$_NewsFromJson(Map<String, dynamic> json) => _$_News(
      sourceName: json['source']['name'] as String,
      sourceLogoUrl: json['sourceLogoUrl'] as String, ///
      category: json['category'] as String, ///
      authorName: json['author'] as String,
      authorImageUrl: json['authorImageUrl'] as String, ///
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      imageUrl: json['urlToImage'] as String,
      publishedDate: DateTime.parse(json['publishedAt'] as String),
    );

Map<String, dynamic> _$$_NewsToJson(_$_News instance) => <String, dynamic>{
      'sourceName': instance.sourceName,
      'sourceLogoUrl': instance.sourceLogoUrl,
      'category': instance.category,
      'authorName': instance.authorName,
      'authorImageUrl': instance.authorImageUrl,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'publishedDate': instance.publishedDate.toIso8601String(),
    };
