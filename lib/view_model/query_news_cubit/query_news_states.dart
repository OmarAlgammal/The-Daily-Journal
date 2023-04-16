import 'package:equatable/equatable.dart';

import '../../models/news_model.dart';

abstract class QueryNewsState extends Equatable {}

class AllNewsLoading extends QueryNewsState {
  @override
  List<Object?> get props => [];
}

class InitialQueryNewsState extends QueryNewsState{
  @override
  List<Object?> get props => [];
}

class AllNewsLoadedSuccessfully extends QueryNewsState {
  final List<NewsModel> news;

  AllNewsLoadedSuccessfully(this.news);

  @override
  List<Object?> get props => [news];
}

class FailedToLoadQueryNews extends QueryNewsState {
  final String message;

  FailedToLoadQueryNews(this.message);

  @override
  List<Object?> get props => [message];
}

class QueryNewsLoading extends QueryNewsState {
  @override
  List<Object?> get props => [];
}

class QueryNewsLoadedSuccessfully extends QueryNewsState {
  final List<NewsModel> news;

  QueryNewsLoadedSuccessfully(this.news);

  @override
  List<Object?> get props => [news];
}

class FailedToLoadQueryResults extends QueryNewsState {
  final String message;

  FailedToLoadQueryResults(this.message);

  @override
  List<Object?> get props => [message];
}
