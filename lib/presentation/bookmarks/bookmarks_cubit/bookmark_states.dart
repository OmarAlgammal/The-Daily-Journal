
import 'package:equatable/equatable.dart';

import '../../../domain/news/entities/news.dart';

abstract class BookmarkState extends Equatable{}

class BookmarksLoading extends BookmarkState{
  @override
  List<Object?> get props => [];
}

class BookmarksLoadedSuccessfully extends BookmarkState{
  final List<News> bookmark;
  BookmarksLoadedSuccessfully({required this.bookmark});

  @override
  List<Object?> get props => [bookmark];
}

class BookmarkIsBeingSaved extends BookmarkState{
  @override
  List<Object?> get props => [];

}
class BookmarkSavedSuccessfully extends BookmarkState{
  @override
  List<Object?> get props => [];

}

class FailedToLoadBookmarks extends BookmarkState{
  @override
  List<Object?> get props => [];
}

class BookmarkDeletedSuccessfully extends BookmarkState{
  @override
  List<Object?> get props => [];

}