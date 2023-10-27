import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../models/news_model.dart';
import '../../utils/enums/news_categories.dart';

// part 'news_states.freezed.dart';
//
// @Freezed()
// abstract class NewsState with _$NewsState {
//   factory NewsState.newsLoading() = NewsLoading;
//
//   factory NewsState.failedToLoadNews({required String message, IconData? icon}) = FailedToLoadNews;
//
//   factory NewsState.newsLoadedSuccessfully(List<NewsModel> news, NewsCategories category) = NewsLoadedSuccessfully;
// }

abstract class NewsState extends Equatable {
  final NewsCategories? category;

  NewsState({this.category});
}

class NewsLoading extends NewsState {
  NewsLoading({super.category});

  @override
  List<Object?> get props => [category];
}

class FailedToLoadNews extends NewsState {
  final String message;
  final IconData? icon;

  FailedToLoadNews(
      {super.category, required, required this.message, this.icon});

  @override
  List<Object?> get props => [category, message, icon];
}

class NewsLoadedSuccessfully extends NewsState {
  final List<NewsModel> news;
  NewsLoadedSuccessfully({required this.news, super.category});

  @override
  List<Object?> get props => [category];
}
