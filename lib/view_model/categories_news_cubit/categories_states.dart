import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/news_model.dart';

part 'categories_states.freezed.dart';



@Freezed()
class CategoriesState with _$CategoriesState {


  factory CategoriesState.categoryLoading() = Loading;

  factory CategoriesState.failedToLoadCategory(String message) = Failed;

  factory CategoriesState.businessCategoryLoadedSuccessfully(
      List<NewsModel> news) = BusinessCategoryLoadedSuccessfully;

  factory CategoriesState.entertainmentCategoryLoadedSuccessfully(
      List<NewsModel> news) = EntertainmentCategoryLoadedSuccessfully;

  factory CategoriesState.scienceCategoryLoadedSuccessfully(
      List<NewsModel> news) = ScienceCategoryLoadedSuccessfully;

  factory CategoriesState.sportsCategoryLoadedSuccessfully(
      List<NewsModel> news) = SportsCategoryLoadedSuccessfully;

  factory CategoriesState.healthCategoryLoadedSuccessfully(
      List<NewsModel> news) = HealthCategoryLoadedSuccessfully;

  factory CategoriesState.technologyCategoryLoadedSuccessfully(
      List<NewsModel> news) = TechnologyCategoryLoadedSuccessfully;

  /// TODO: Change this name
  factory CategoriesState.fromEgyptCategoryLoadedSuccessfully(
      List<NewsModel> news) = FromEgyptCategoryLoadedSuccessfully;
  /// TODO: Change this name
  factory CategoriesState.fromUsCategoryLoadedSuccessfully(
      List<NewsModel> news) = FromUsCategoryLoadedSuccessfully;

  factory CategoriesState.generalCategoryLoadedSuccessfully(
      List<NewsModel> news) = GeneralCategoryLoadedSuccessfully;
}