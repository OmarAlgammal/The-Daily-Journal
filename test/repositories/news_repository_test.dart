import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_daily_journal/core/network/erorrs/server_failure.dart';
import 'package:the_daily_journal/models/news_model.dart';
import 'package:the_daily_journal/repositories/news_repository.dart';

import '../mock_helpers/mock_generations.mocks.dart';

void main() {
  late final MockBaseNewsService mockBaseNewsService;
  late final NewsRepository newsRepository;
  late final news;
  setUpAll(() {
    mockBaseNewsService = MockBaseNewsService();
    newsRepository = NewsRepository(mockBaseNewsService);
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

  group('fetchQueryNews()', () {
    test('fetchQueryNews() should return Right(List<NewsModel>)', () async {
      // Arrange
      when(mockBaseNewsService.getData<List<NewsModel>>(
              path: anyNamed('path'), builder: anyNamed('builder')))
          .thenAnswer((realInvocation) async => Right(news));

      // Act
      final result = await newsRepository.fetchQueryNews(
        query: '',
        sort: '',
      );

      // Assert
      expect(result, Right(news));
    });

    test('fetchQueryNews() should return Left(ServerFailure)', () async {
      // Arrange
      when(mockBaseNewsService.getData<List<NewsModel>>(
              path: anyNamed('path'), builder: anyNamed('builder')))
          .thenAnswer((_) async => const Left(ServerFailure('')));

      // Act
      final result = await newsRepository.fetchQueryNews();

      // Assert
      expect(result, isA<Left>());
    });
  });
}
