import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/news_model.dart';
import '../../utils/enums/news_categories.dart';

part 'news_states.freezed.dart';

@Freezed()
class NewsState with _$NewsState {
  factory NewsState.newsLoading() = NewsLoading;

  factory NewsState.failedToLoadNews(String message) = FailedToLoadNews;

  factory NewsState.newsLoadedSuccessfully(List<NewsModel> news, NewsCategories category) = NewsLoadedSuccessfully;
}
