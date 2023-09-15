
import 'package:dartz/dartz.dart';
import 'package:the_daily_journal/core/network/api_constance.dart';
import 'package:the_daily_journal/services/news_service.dart';

import '../core/network/erorrs/server_failure.dart';
import '../models/news_model.dart';

abstract class BaseNewsDatabase{
  Future<Either<ServerFailure, List<NewsModel>>> getQueryNews({String? query, String? sort});

  Future<Either<ServerFailure, List<NewsModel>>> getTopCountryHeadlines(String countryCode, int? pageSize);

  Future<Either<ServerFailure, List<NewsModel>>> getTopCategoryHeadlines(
      String category);
}

class NewsDatabase implements BaseNewsDatabase{

  final BaseNewsService _baseNewsApiService;

  NewsDatabase(this._baseNewsApiService);

  @override
  Future<Either<ServerFailure, List<NewsModel>>> getQueryNews({String? query, String? sort}) async{
    return await _baseNewsApiService.getData<List<NewsModel>>(path: ApiConstance.allNewsPath(query: query, sort: sort), builder: (List<Map<String, dynamic>> maps) => maps.map((e) => NewsModel.fromJson(e)).toList());
  }

  @override
  Future<Either<ServerFailure, List<NewsModel>>> getTopCategoryHeadlines(String category) async{
        return await _baseNewsApiService.getData<List<NewsModel>>(path: ApiConstance.topCategoryHeadlinesPath(category), builder: (List<Map<String, dynamic>> maps) => maps.map((e) => NewsModel.fromJson(e)).toList());
  }

  @override
  Future<Either<ServerFailure, List<NewsModel>>> getTopCountryHeadlines(String countryCode, int? pageSize) async{
        return await _baseNewsApiService.getData<List<NewsModel>>(path: ApiConstance.topCountryHeadlinesPath(countryCode, pageSize), builder: (List<Map<String, dynamic>> maps) => maps.map((e) => NewsModel.fromJson(e)).toList(),);
    
  }


}