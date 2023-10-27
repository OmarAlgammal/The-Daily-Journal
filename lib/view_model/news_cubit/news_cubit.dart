import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/core/network/api_constance.dart';
import 'package:the_daily_journal/utils/enums/news_categories.dart';
import 'package:the_daily_journal/view_model/news_cubit/news_states.dart';

import '../../repositories/news_repository.dart';

class NewsCubit extends Cubit<NewsState> {
  final BaseNewsRepository _baseNewsApiDatabase;

  NewsCubit(this._baseNewsApiDatabase) : super(NewsLoading());

  static NewsCubit instance(context) => BlocProvider.of<NewsCubit>(context);

  void fetchNewsByCategory({required category, String? query, String? sort}) {
    emit(NewsLoading(category: category));
    final path = _getCategoryPath(category, query, sort);
    _baseNewsApiDatabase
        .fetchNewsByCategory(path: path, category: category)
        .then((value) => value.fold(
            (left) =>
                emit(FailedToLoadNews(category: category, message: left.message, icon: left.icon)),
            (right) => emit(NewsLoadedSuccessfully(category: category, news: right,))));
  }

  String _getCategoryPath(
      NewsCategories newsCategory, String? query, String? sort) {
    return switch (newsCategory) {
      NewsCategories.all => ApiConstance.allNewsPath(query: query, sort: sort),
      _ => newsCategory.countryCode != null
          ? ApiConstance.topCountryHeadlinesPath(
              countryCode: newsCategory.countryCode!,
              pageSize: newsCategory.pageSize)
          : ApiConstance.allNewsPath(query: newsCategory.title),
    };
  }
}
