import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_daily_journal/models/news_model.dart';
import 'package:the_daily_journal/repositories/local_repository.dart';

import '../mock_helpers/mock_generations.mocks.dart';
import '../mock_helpers/utils/post_expextations.dart';

void main() {
  late NewsModel newsModel;
  late MockBox<NewsModel> mockBox;
  late MockBaseLocalServices mockBaseLocalServices;
  late LocalDatabase localDatabase;

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
    mockBox = MockBox<NewsModel>();
    mockBaseLocalServices = MockBaseLocalServices();
    localDatabase = LocalDatabase(mockBaseLocalServices);
  });

  test('deleteBookmark() should delete a value using a key', () async {
    // Arrange
    when(mockBaseLocalServices.delete(any)).answer({});

    // Act
    await localDatabase.deleteBookmark('key');

    // Assert
    verify(mockBaseLocalServices.delete(any));
  });

  test('getBox() should return a Box<NewsModel>', () async {
    // Arrange
    when(mockBaseLocalServices.getBox()).thenReturn(mockBox);

    // Act
    localDatabase.getBookmarksBox();

    // Assert
    verify(mockBaseLocalServices.getBox());
  });

  test('createBookmark() should write data in hive box', () async {
    // Arrange
    when(mockBaseLocalServices.writeData(any, any)).answerVoid;

    // Act
    await localDatabase.createBookmark('key', newsModel);

    // Assert
    verify(mockBaseLocalServices.writeData(any, any));
  });

  group('saveVerification()', () {
    test('saveVerification() should return true', () {
      // Arrange
      when(mockBaseLocalServices.saveVerification(any)).thenReturn(true);

      // Act
      localDatabase.saveVerification('key');

      // Assert
      verify(mockBaseLocalServices.saveVerification(any));
    });

    test('saveVerification() should return false', () {
      // Arrange
      when(mockBaseLocalServices.saveVerification(any)).thenReturn(false);

      // Act
      localDatabase.saveVerification('key');

      // Assert
      verify(mockBaseLocalServices.saveVerification(any));
    });
  });
}
