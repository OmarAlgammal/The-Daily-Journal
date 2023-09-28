import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_daily_journal/models/news_model.dart';
import 'package:the_daily_journal/services/local_services.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import '../mock_helpers/mock_generations.mocks.dart';
import '../mock_helpers/utils/post_expextations.dart';
import 'my_path_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockHiveInterface mockHiveInterface;
  late MockBox<NewsModel> mockBox;
  late LocalServices localServices;

  late NewsModel newsModel;
  setUp(() async {
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
    PathProviderPlatform.instance = MockPathProviderPlatform();

    mockHiveInterface = MockHiveInterface();
    mockBox = MockBox();
    localServices = LocalServices(mockHiveInterface);

    when(mockHiveInterface.openBox(any)).thenAnswer((_) async => mockBox);
    await localServices.init();
  });

  test('writeData() should save a value', () async {
    when(mockBox.put(any, any)).answerVoid;
    await localServices.writeData('key', newsModel);
    verify(mockBox.put(any, any));
  });

  test('getBox() should return a Box', () async {
    final result = localServices.getBox();
    expect(result, mockBox);
  });

  group('saveVerification()', () {
    test('saveVerification() should return true', () {
      when(mockBox.get(any)).thenReturn(newsModel);
      final result = localServices.saveVerification('key');
      expect(result, true);
    });

    test('saveVerification() should return false', () {
      when(mockBox.get(any)).returnNull;
      final result = localServices.saveVerification('key');
      expect(result, false);
    });
  });

  test('delete() should delete a value', () async {
    when(mockBox.delete(any)).answerVoid;
    await localServices.delete('');
    verify(mockBox.delete(any));
  });
}
