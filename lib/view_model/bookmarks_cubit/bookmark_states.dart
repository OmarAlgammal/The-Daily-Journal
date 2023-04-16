
import 'package:equatable/equatable.dart';

import '../../models/news_model.dart';

abstract class BookmarkState extends Equatable{}

class BookmarksLoading extends BookmarkState{
  @override
  List<Object?> get props => [];
}

class BookmarksLoadedSuccessfully extends BookmarkState{
  final List<NewsModel> bookmarks;
  BookmarksLoadedSuccessfully({required this.bookmarks});

  @override
  List<Object?> get props => [bookmarks];
}

class BookmarkIsBeingSaved extends BookmarkState{
  @override
  List<Object?> get props => [];

}
class BookmarkSavedSuccessfully extends BookmarkState{
  final String id;
  BookmarkSavedSuccessfully(this.id);
  @override
  List<Object?> get props => [id];

}

class FailedToLoadBookmarks extends BookmarkState{
  @override
  List<Object?> get props => [];
}


class DeletingBookmark extends BookmarkState{
  @override
  List<Object?> get props => [];
}

class BookmarkDeletedSuccessfully extends BookmarkState{
  @override
  List<Object?> get props => [];

}

class Failed extends BookmarkState{
  final String message;
  Failed(this.message);
  @override
  List<Object?> get props => [message];
}