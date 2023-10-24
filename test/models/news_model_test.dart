import 'package:flutter_test/flutter_test.dart';
import 'package:the_daily_journal/models/news_model.dart';

import '../mock_helpers/json_helper/json_reader.dart';

void main() {
  late final NewsModel newsModel;
  setUp(() {
    newsModel = NewsModel(
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
        publishedDate: DateTime.now());
  });

  test('toJson() should return Map<String, dynamic>', () {
    // Arrange
    final result = newsModel.toJson();

    // Assert
    expect(result, isA<Map<String, dynamic>>());
  });

  test('fromJson() should return a NewsModel', () async {
    // Arrange
    final json = await readJson();
    final listOfMaps = json['articles'] as List;

    // Act
    final result = NewsModel.fromJson(listOfMaps.first);

    // Assert
    expect(result, isA<NewsModel>());
  });
}
