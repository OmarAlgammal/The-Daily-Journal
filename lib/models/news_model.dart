import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@Freezed()
@HiveType(typeId: 0)
class NewsModel with _$NewsModel {
  factory NewsModel({
    @HiveField(0) required String sourceName,
    @HiveField(1) required String sourceLogoUrl,
    @HiveField(2) required String category,
    @HiveField(3) required String authorName,
    @HiveField(4) required String authorImageUrl,
    @HiveField(5) required String title,
    @HiveField(6) required String description,
    @HiveField(7) required String content,
    @HiveField(8) required String url,
    @HiveField(9) required String imageUrl,
    @HiveField(10) required DateTime publishedDate,
  }) = _News;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        sourceName: json['source']['name'] ?? '',
        sourceLogoUrl: 'https://www.spa.gov.sa/include/images/logo.png',
        category: 'Business',
        authorName: json['author'] ?? 'unavailable',
        authorImageUrl:
            'https://www.mediabistro.com/wp-content/uploads/2014/09/best-selling-author.jpg',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        content: json['content'] ?? '',
        url: json['url'] ?? '',
        imageUrl: json['urlToImage'] ?? 'https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=',
        publishedDate: DateTime.parse(json['publishedAt'] ?? ''),
      );
}
