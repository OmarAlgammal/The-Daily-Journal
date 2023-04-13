import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@Freezed()
class NewsModel with _$NewsModel{

  factory NewsModel({
    required String sourceName,
    required String sourceLogoUrl,
    required String category,
    required String authorName,
    required String authorImageUrl,
    required String title,
    required String description,
    required String url,
    required String imageUrl,
    required DateTime publishedDate,
}) = _News;

  factory NewsModel.fromJson(Map<String, dynamic> map) => _$NewsModelFromJson(map);
}
