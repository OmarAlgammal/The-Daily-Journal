
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bookmark_states.dart';

class BookmarkCubit extends Cubit<BookmarkState>{
  BookmarkCubit() : super(BookmarksLoading());

  static BookmarkCubit instance(context) => BlocProvider.of<BookmarkCubit>(context);

  bool _saved = false;

  void saveAsBookmark() async{
    if (!_saved){
      emit(BookmarkSavedSuccessfully());
    }else{
      emit(BookmarkDeletedSuccessfully());
    }
    _saved = ! _saved;
    /// TODO: Complete this method
  }

  void getBookmarks(){
    /// TODO: Complete this method
  }

  void deleteBookmark(){
    /// TODO: Complete this method
  }

}