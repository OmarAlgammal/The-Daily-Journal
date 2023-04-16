import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/view_model/query_news_cubit/query_news_states.dart';

import '../../database/news_api_database.dart';
import '../../models/news_model.dart';

class QueryNewsCubit extends Cubit<QueryNewsState> {
  final BaseNewsApiDatabase _baseNewsApiDataBase;

  static QueryNewsCubit instance(BuildContext context) =>
      BlocProvider.of<QueryNewsCubit>(context);

  QueryNewsCubit(this._baseNewsApiDataBase) : super(InitialQueryNewsState());

  void _loadQueryNews(
      {String? query, String? sort, required QueryNewsState Function(List<
          NewsModel> news) onSuccess}) async {
    final result = await _baseNewsApiDataBase.getQueryNews(query: query, sort: sort,);
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
