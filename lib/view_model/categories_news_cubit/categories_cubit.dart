import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/view_model/categories_news_cubit/categories_states.dart';

import '../../models/news_model.dart';
import '../../repositories/news_repository.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final BaseNewsRepository _baseNewsApiDatabase;

  CategoriesCubit(this._baseNewsApiDatabase)
      : super(CategoriesState.categoryLoading());

  static CategoriesCubit instance(context) =>
      BlocProvider.of<CategoriesCubit>(context);

  void _loadCategoryNews(String category,
      CategoriesState Function(List<NewsModel>) onSuccess) async {
    emit(Loading());
    final response =
        await _baseNewsApiDatabase.fetchTopCategoryHeadlines(category);
    response.fold((failure) => emit(Failed(failure.message)),
        (newsList) => emit(onSuccess(newsList)));
  }

  void _loadCountryNews(
      {required String countryCode,
      int? pageSize,
      required CategoriesState Function(List<NewsModel>) onSuccess}) async {
    emit(Loading());
    final response = await _baseNewsApiDatabase.fetchTopCountryHeadlines(
        countryCode, pageSize);
    response.fold((failure) => emit(Failed(failure.message)),
        (newsList) => emit(onSuccess(newsList)));
  }

  void getBusinessNews() async {
    _loadCategoryNews(
        'business', CategoriesState.businessCategoryLoadedSuccessfully);
  }

  void getEntertainmentNews() async {
    _loadCategoryNews('entertainment',
        CategoriesState.entertainmentCategoryLoadedSuccessfully);
  }

  void getScienceNews() async {
    _loadCategoryNews(
        'science', (CategoriesState.scienceCategoryLoadedSuccessfully));
  }

  void getSportsNews() async {
    _loadCategoryNews(
        'sports', CategoriesState.sportsCategoryLoadedSuccessfully);
  }

  void getHealthNews() async {
    _loadCategoryNews(
        'health', CategoriesState.healthCategoryLoadedSuccessfully);
  }

  void getTechnologyNews() async {
    _loadCategoryNews(
        'technology', CategoriesState.technologyCategoryLoadedSuccessfully);
  }

  void getGeneralNews() async {
    _loadCategoryNews(
        'general', CategoriesState.generalCategoryLoadedSuccessfully);
  }

  void getBreakingNews() async {
    _loadCountryNews(
        countryCode: 'us', pageSize: 7, onSuccess: CategoriesState.fromUsCategoryLoadedSuccessfully);
  }

  void getEgyptNews() async {
    _loadCountryNews(
        countryCode: 'eg', onSuccess: CategoriesState.fromEgyptCategoryLoadedSuccessfully);
  }
}
