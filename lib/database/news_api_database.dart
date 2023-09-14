
import 'package:dartz/dartz.dart';
import 'package:the_daily_journal/core/network/api_constance.dart';
import 'package:the_daily_journal/services/news_api_services.dart';

import '../core/network/erorrs/server_failure.dart';
import '../models/news_model.dart';

abstract class BaseNewsApiDatabase{
  Future<Either<ServerFailure, List<NewsModel>>> getQueryNews({String? query, String? sort});

  Future<Either<ServerFailure, List<NewsModel>>> getTopCountryHeadlines(String countryCode, int? pageSize);

  Future<Either<ServerFailure, List<NewsModel>>> getTopCategoryHeadlines(
      String category);
}

class NewsApiDatabase implements BaseNewsApiDatabase{

  final BaseNewsApiServices _baseNewsApiServices;

  NewsApiDatabase(this._baseNewsApiServices);

  @override
  Future<Either<ServerFailure, List<NewsModel>>> getQueryNews({String? query, String? sort}) async{
    return await _baseNewsApiServices.getQueryNews(query: query, sort: sort);
  }

  @override
  Future<Either<ServerFailure, List<NewsModel>>> getTopCategoryHeadlines(String category) async{
    return await _baseNewsApiServices.getTopHeadlines(ApiConstance.topCategoryHeadlinesPath(category));
  }

  @override
  Future<Either<ServerFailure, List<NewsModel>>> getTopCountryHeadlines(String countryCode, int? pageSize) async{
    return await _baseNewsApiServices.getTopHeadlines(ApiConstance.topCountryHeadlinesPath(countryCode, pageSize));
  }


}