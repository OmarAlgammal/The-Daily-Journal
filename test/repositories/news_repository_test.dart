import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_daily_journal/core/network/api_constance.dart';
import 'package:the_daily_journal/core/network/erorrs/server_failure.dart';
import 'package:the_daily_journal/models/news_model.dart';
import 'package:the_daily_journal/repositories/news_repository.dart';
import 'package:the_daily_journal/services/news_service.dart';
import 'package:the_daily_journal/utils/enums/news_categories.dart';

class MockBaseNewsService extends Mock implements BaseNewsService {
  late bool rightValue;
  final news = [
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

  @override
  Future<Either<ServerFailure, T>> fetchData<T>(
      {required String path, required DataBuilder<T> builder}) async {
    if (rightValue) {
      return Right(news as T);
    } else {
      return Left(ServerFailure('error'));
    }
  }
}

void main() {
  late final MockBaseNewsService mockBaseNewsService;
  late final NewsRepository newsRepository;
  late final List<NewsModel> news;
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

  group('fetchNewsByCategory()', () {
    test(
        'fetchNewsByCategory() should return List<NewsModel>',
        () async {
      // Arrange
      mockBaseNewsService.rightValue = true;
      //Act
      final result = await newsRepository.fetchNewsByCategory(
          path: ApiConstance.allNewsPath(), category: NewsCategories.search);

      // Assert
      expect(result, isA<Right>());
    });

    test('fetchNewsByCategory() should return Left<ServerFailure>', () async{
      // Arrange
      mockBaseNewsService.rightValue = false;

      // Act
      final result = await newsRepository.fetchNewsByCategory(path: ApiConstance.allNewsPath(), category: NewsCategories.search);

      // Assert
      expect(result, isA<Left>());

    });
  });
}
