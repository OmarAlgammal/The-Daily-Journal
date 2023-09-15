import 'package:either_dart/either.dart';
import 'package:dio/dio.dart';
import 'package:the_daily_journal/core/network/erorrs/server_failure.dart';

import '../core/network/erorrs/exceptions.dart';

typedef DataBuilder<T> = T Function(List<Map<String ,dynamic>> maps);

abstract class BaseNewsService {
  Future<Either<ServerFailure, T>> getData<T>(
      {required String path,  required DataBuilder<T> builder});
}

class NewsService implements BaseNewsService {
  final Dio _dio;

  NewsService(this._dio);

  @override
  Future<Either<ServerFailure, T>> getData<T>(
      {required String path,  required DataBuilder<T> builder}) async {
    
    try {
      final response =
          await _dio.get(path);

      final result = response.data['articles'] as List;
      return Right(builder(result.map((e) => e as Map<String, dynamic>).toList()));

      /// TODO: Refactor error code
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError) {
        return const Left(ServerFailure('No internet connection'));
      }
      return const Left(ServerFailure('Failed to get data'));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
