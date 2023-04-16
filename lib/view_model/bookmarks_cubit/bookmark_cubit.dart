
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/database/local_database.dart';
import 'package:the_daily_journal/models/news_model.dart';

import 'bookmark_states.dart';

class BookmarkCubit extends Cubit<BookmarkState>{
  BookmarkCubit(this._baseLocalDatabase) : super(BookmarksLoading());

  static BookmarkCubit instance(context) => BlocProvider.of<BookmarkCubit>(context);

  final BaseLocalDatabase _baseLocalDatabase;

  void saveAsBookmark(NewsModel news) async{
    emit(BookmarkIsBeingSaved());
    try{
      await _baseLocalDatabase.createBookmark(news.title, news);
      emit(BookmarkSavedSuccessfully(news.title));
    }catch(e){
      emit(Failed(e.toString()));
    }

  }

  void deleteBookmark(String key) async{
    emit(DeletingBookmark());
    try{
      await _baseLocalDatabase.deleteBookmark(key);
      emit(BookmarkDeletedSuccessfully());
    }catch(e){
      emit(Failed(e.toString()));
    }
  }

}