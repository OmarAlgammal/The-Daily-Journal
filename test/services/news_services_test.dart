import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_daily_journal/core/network/api_constance.dart';
import 'package:the_daily_journal/models/news_model.dart';
import 'package:the_daily_journal/services/news_services.dart';

import '../test_helpers/json_reader.dart';
import '../test_helpers/mocks_generation.mocks.dart';

void main() {
  late List<NewsModel> news;

  late NewsService newsService;
  late MockDio mockDio;

  setUp(() {
    newsService = NewsService();
    mockDio = MockDio();
    newsService.dio = mockDio;
    news = [
      NewsModel(
          sourceName: 'sourceName',
          sourceLogoUrl: 'sourceLogoUrl',
          category: 'category',
          authorName: 'authorName',
          authorImageUrl: 'authorImageUrl',
          title: 'title',
          description: 'description',
          content: 'content',
          url: 'url',
          imageUrl: 'imageUrl',
          publishedDate: DateTime.now()),
    ];
  });

  group('fetchData()', () {
    test('fetchData() should return List<NewsModel>()', () async {
      // Arrange
      when(mockDio.get(ApiConstance.topCategoryHeadlinesPath('sport')))
          .thenAnswer(
        (_) async => Response(
          data: readJson(),
          statusCode: 200,
          requestOptions: RequestOptions(),
        ),
      );

      // Act
      final result = await newsService.fetchData(
          builder: (maps) => maps.map((e) => NewsModel.fromJson(e)).toList());

      // Arrange
      expect(result, Right(news));
    });
  });
}
