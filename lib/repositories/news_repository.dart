import 'package:either_dart/either.dart';
import 'package:the_daily_journal/services/news_service.dart';
import 'package:the_daily_journal/utils/enums/news_categories.dart';

import '../core/network/exceptions/server_exception.dart';
import '../models/news_model.dart';

abstract class BaseNewsRepository {
  Future<Either<MyException, List<NewsModel>>> fetchNewsByCategory({
    required String path,
    required NewsCategories category,
  });
}

class NewsRepository implements BaseNewsRepository {
  final BaseNewsService _baseNewsService;
  Map<NewsCategories, List<NewsModel>> cache = {};
  NewsRepository(this._baseNewsService);

  @override
  Future<Either<MyException, List<NewsModel>>> fetchNewsByCategory({
    required String path,
    required NewsCategories category,
  }) async {
    if (category == NewsCategories.search) {
      return await _baseNewsService.fetchData<List<NewsModel>>(
          path: path,
          builder: (maps) => maps.map((e) => NewsModel.fromJson(e)).toList());
    }
    if (cache.containsKey(category)) {
      return Right(cache[category]!);
    }
    final result = await _baseNewsService.fetchData<List<NewsModel>>(
        path: path,
        builder: (maps) => maps.map((e) => NewsModel.fromJson(e)).toList());

    return result.fold((left) => Left(left), (right) {
      cache[category] = right;
      return Right(right);
    });
  }
}
