import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:the_daily_journal/utils/constance/icons.dart';

import '../core/network/exceptions/server_exception.dart';

typedef DataBuilder<T> = T Function(List<Map<String, dynamic>> maps);

abstract class BaseNewsService {
  Future<Either<MyException, T>> fetchData<T>({
    required String path,
    required DataBuilder<T> builder,
  });
}

class NewsService implements BaseNewsService {
  final Dio _dio;

  NewsService(this._dio);

  @override
  Future<Either<MyException, T>> fetchData<T>({
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
      if (e.error is SocketException) {
        return const Left(NoInternetConnectionException(
          message: 'No internet',
          icon: AppIcons.noInternetIcon,
        ));
      } else if (e.type == DioExceptionType.connectionError) {
        // Handle HTTP response errors (e.g., 404, 500, etc.) here if needed.
        return Left(ServerException(
          message: 'Error : ${e.message}',
        ));
      } else {
        return Left(ServerException(
          message: 'Error : ${e.toString()}',
        ));
      }
    } catch (e) {
      return Left(ServerException(
        message: 'Error : ${e.toString()}',
      ));
    }
  }
}
