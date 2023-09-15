import 'package:either_dart/either.dart';
import 'package:the_daily_journal/services/news_service.dart';

import '../core/network/erorrs/server_failure.dart';
import '../models/news_model.dart';

abstract class BaseNewsRepository {
  Future<Either<ServerFailure, List<NewsModel>>> fetchNewsByCategory({
    required String path,
    required String category,
  });
}

class NewsRepository implements BaseNewsRepository {
  final BaseNewsService _baseNewsApiService;
  Map<String, List<NewsModel>> _cache = {};
  NewsRepository(this._baseNewsApiService);

  @override
  Future<Either<ServerFailure, List<NewsModel>>> fetchNewsByCategory({
    required String path,
    required String category,
  }) async {
    if (_cache.containsKey(category)) {
      return Right(_cache[category] ?? []);
    }
    final result = await _baseNewsApiService.getData<List<NewsModel>>(
        path: path,
        builder: (maps) => maps.map((e) => NewsModel.fromJson(e)).toList());

    return result.fold((left) => Left(left), (right) {
      _cache[category] = right;
      return Right(right);
    });
  }
}
