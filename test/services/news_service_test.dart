import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_daily_journal/core/network/api_constance.dart';
import 'package:the_daily_journal/core/network/erorrs/server_failure.dart';
import 'package:the_daily_journal/services/news_service.dart';

import '../mock_helpers/json_helper/json_reader.dart';
import '../mock_helpers/mock_generations.mocks.dart';

void main() {
  late final NewsService newsService;
  late MockDio mockDio;

  setUpAll(() {
    mockDio = MockDio();
    newsService = NewsService(mockDio);
  });

  group('fetchData()', () {
    test('getData() should return Right', () async {
      // Arragne
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: await readJson(),
          statusCode: 200,
          requestOptions: RequestOptions(),
        ),
      );

      // Act
      final result = await newsService.getData(
          path: ApiConstance.allNewsPath(), builder: (maps) => Right(maps));

      // Assert
      expect(result, isA<Right>());
    });

    test('getData() should return Left', () async {
      // Arrange
      when(mockDio.get(any)).thenAnswer((realInvocation) async => Response(
            requestOptions: RequestOptions(),
          ));

      // Act
      final result = await newsService.getData(
          path: ApiConstance.allNewsPath(),
          builder: (maps) => const Left(ServerFailure('error')));

      // Assert
      expect(result, isA<Left>());
    });
  });
}
