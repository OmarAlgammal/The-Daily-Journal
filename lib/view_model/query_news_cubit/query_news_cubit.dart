import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/view_model/query_news_cubit/query_news_states.dart';

import '../../models/news_model.dart';
import '../../repositories/news_repository.dart';

class QueryNewsCubit extends Cubit<QueryNewsState> {
  final BaseNewsRepository _baseNewsApiDataBase;

  static QueryNewsCubit instance(BuildContext context) =>
      BlocProvider.of<QueryNewsCubit>(context);

  QueryNewsCubit(this._baseNewsApiDataBase) : super(InitialQueryNewsState());

  void _loadQueryNews(
      {String? query, String? sort, required QueryNewsState Function(List<
          NewsModel> news) onSuccess}) async {
    final result = await _baseNewsApiDataBase.fetchNewsByCategory(query: query, sort: sort,);
    result.fold((failure) => emit(FailedToLoadQueryNews(failure.message)),
            (newsList) => emit(onSuccess(newsList)));
  }

  void getAllNews() async {
    _loadQueryNews(onSuccess: AllNewsLoadedSuccessfully.new);
  }

  void getQueryNews({String? query, String? sort}) async {
    emit(QueryNewsLoading());
    _loadQueryNews(
        query: query, sort: sort, onSuccess: QueryNewsLoadedSuccessfully.new);
  }
}
