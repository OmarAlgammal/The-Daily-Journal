import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:the_daily_journal/core/network/api_constance.dart';
import 'package:the_daily_journal/core/network/erorrs/server_failure.dart';

import '../core/network/erorrs/exceptions.dart';

abstract class BaseNewsServices {
  Future<Either<ServerFailure, T>> fetchData<T>(
      {String? query,
      String? sort,
      required T Function(List<Map<String, dynamic>> maps) builder});

  Future<Either<ServerFailure, T>> fetchDataWithQuery<T>({
    required String path,
    required T Function(List<Map<String, dynamic>> maps) builder,
  });
}

class NewsService implements BaseNewsServices {
  late Dio dio;

  NewsService() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstance.baseUrl,
      ),
    );
  }

  @override
  Future<Either<ServerFailure, T>> fetchData<T>(
      {String? query,
      String? sort,
      required T Function(List<Map<String, dynamic>>) builder}) async {
    try {
      final response =
          await dio.get(ApiConstance.allNewsPath(query: query, sort: sort));
      final responseData = response.data as Map<String, dynamic>;

      final omar = 'omar' as int;
      if (responseData['status'] == 'error') {
        return Left(ServerFailure(responseData['message']));
      }

      final articles = responseData['articles'] as List<Map<String, dynamic>>;

      return Right(
          builder(articles.map((e) => e as Map<String, dynamic>).toList()));

      /// TODO: Refactor error code
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return const Left(ServerFailure('No internet connection'));
      }
      return const Left(ServerFailure('Failed to get data'));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, T>> fetchDataWithQuery<T>({
    required String path,
    required T Function(List<Map<String, dynamic>> maps) builder,
  }) async {
    try {
      final response = await dio.get(path);
      final responseData = response.data as Map<String, dynamic>;

      if (responseData['status'] == 'error') {
        return Left(ServerFailure(responseData['message']));
      }

      final mapsOfArticles = responseData['articles'] as List;
      return Right(builder(
          mapsOfArticles.map((e) => e as Map<String, dynamic>).toList()));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return Left(const ServerFailure('No internet connection'));
      }
      return Left(const ServerFailure('Failed to get data'));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.message),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
