import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_daily_journal/services/news_service.dart';
import 'package:the_daily_journal/utils/enums/news_categories.dart';

import '../core/network/erorrs/server_failure.dart';
import '../models/news_model.dart';

abstract class BaseNewsRepository {
  Future<Either<ServerFailure, List<NewsModel>>> fetchNewsByCategory({
    required String path,
    required NewsCategories category,
  });
}

class NewsRepository implements BaseNewsRepository {
  final BaseNewsService _baseNewsApiService;
  Map<NewsCategories, List<NewsModel>> _cache = {};
  NewsRepository(this._baseNewsApiService);

  @override
  Future<Either<ServerFailure, List<NewsModel>>> fetchNewsByCategory({
    required String path,
    required NewsCategories category,
  }) async {
    debugPrint('News Repository : First >> ${_cache.keys.toString()}');
    if (_cache.containsKey(category)) {
      debugPrint('News repository : get from cache');
      return Right(_cache[category]!);
    }
    debugPrint('News repository : get from data source');
    final result = await _baseNewsApiService.getData<List<NewsModel>>(
        path: path,
        builder: (maps) => maps.map((e) => NewsModel.fromJson(e)).toList());

    return result.fold((left) => Left(left), (right) {
      _cache[category] = right;
      debugPrint('News Repository : Last >> ${_cache.keys.toString()}');
      return Right(right);
    });
  }
}
