import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:the_daily_journal/core/network/erorrs/server_failure.dart';

import '../core/network/erorrs/exceptions.dart';

typedef DataBuilder<T> = T Function(List<Map<String, dynamic>> maps);

abstract class BaseNewsService {
  Future<Either<Failure, T>> fetchData<T>({
    required String path,
    required DataBuilder<T> builder,
  });
}

class NewsService implements BaseNewsService {
  final Dio _dio;

  NewsService(this._dio);

  @override
  Future<Either<Failure, T>> fetchData<T>({
    required String path,
    required DataBuilder<T> builder,
  }) async {
    try {
      final response = await _dio.get(path);

      final result = response.data['articles'] as List;
      return Right(
          builder(result.map((e) => e as Map<String, dynamic>).toList()));

      /// TODO: Refactor error code
    } on DioException catch (e) {
      return switch(e){
      DioExceptionType.connectionError =>  const Left(NoInternetConnection('No internet connection')),
      _ => const Left(ServerFailure('No internet connection')),
      };
    }
    on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
