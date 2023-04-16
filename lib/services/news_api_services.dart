import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_daily_journal/core/network/api_constance.dart';
import 'package:the_daily_journal/core/network/erorrs/server_failure.dart';

import '../core/network/erorrs/exceptions.dart';
import '../models/news_model.dart';

abstract class BaseNewsApiServices {
  Future<Either<ServerFailure, List<NewsModel>>> getQueryNews(
      {String? query, String? sort});

  Future<Either<ServerFailure, List<NewsModel>>> getTopHeadlines(String path);
}

class NewsApiServices implements BaseNewsApiServices {
  late Dio _dio;

  NewsApiServices() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstance.baseUrl,
      ),
    );
  }

  @override
  Future<Either<ServerFailure, List<NewsModel>>> getQueryNews(
      {String? query, String? sort}) async {
    debugPrint('path sort is ${sort.toString()}');
    debugPrint('path here is ${ApiConstance.allNewsPath(query: query, sort: sort)}');
    try {
      final response =
          await _dio.get(ApiConstance.allNewsPath(query: query, sort: sort));
      final responseData = response.data as Map<String, dynamic>;

      if (responseData['status'] == 'error') {
        return left(ServerFailure(responseData['message']));
      }

      final articles = responseData['articles'] as List;

      final newsList =
          articles.map((article) => NewsModel.fromJson(article)).toList();

      return right(newsList);

      /// TODO: Refactor error code
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError) {
        return left(const ServerFailure('No internet connection'));
      }
      return left(const ServerFailure('Failed to get data'));
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<NewsModel>>> getTopHeadlines(
      String path) async {
    try {
      final response = await _dio.get(path);
      final responseData = response.data as Map<String, dynamic>;

      if (responseData['status'] == 'error') {
        return left(ServerFailure(responseData['message']));
      }

      final articles = responseData['articles'] as List;
      final newsList =
          articles.map((article) => NewsModel.fromJson(article)).toList();
      return right(newsList);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError) {
        return left(const ServerFailure('No internet connection'));
      }
      return left(const ServerFailure('Failed to get data'));
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
