import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:the_daily_journal/models/news_model.dart';
import 'package:the_daily_journal/services/local_services.dart';

import '../mock_helpers/mock_generations.mocks.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late final MockHiveInterface mockHiveInterface;
  late final MockBox mockBox;
  late final LocalServices localServices;
  setUp(() async {
    mockBox = MockBox();
    mockHiveInterface = MockHiveInterface();
    localServices = LocalServices(mockHiveInterface);

    mockHiveInterface.init(path.join(
        '.dart_tool', 'hive_test')); // Use a temporary directory for testing
    mockHiveInterface.registerAdapter(NewsModelAdapter());
  });

  void main() {
    group('LocalServices Init Tests', () {
      late final MockHiveInterface mockHiveInterface;
      late final MockBox mockBox;
      late final LocalServices localServices;

      setUp(() async {
        mockBox = MockBox();
        mockHiveInterface = MockHiveInterface();
        localServices = LocalServices(mockHiveInterface);

        // Mock the path_provider plugin

        // Ensure that the Flutter environment is initialized for testing
        await TestWidgetsFlutterBinding.ensureInitialized();

        // Mock the behavior of Hive's init and openBox methods
        when(mockHiveInterface.init(any)).thenAnswer((_) async {});
        when(mockHiveInterface.openBox(any)).thenAnswer((_) async => mockBox);

        // Register Hive adapter
        mockHiveInterface.registerAdapter(NewsModelAdapter());
      });

      testWidgets('init initializes Hive and opens the box',
          (WidgetTester tester) async {
        // Call the init method
        //await localServices.init('directory');

        // Verify that Hive's init and openBox methods were called with the correct arguments
        verify(mockHiveInterface.init(argThat(endsWith('hive_testing_path'))))
            .called(1);
        verify(mockHiveInterface.openBox('Categories-box')).called(1);

        // Verify that the box was successfully opened
        expect(localServices.getBox(), equals(mockBox));
      });
    });
  }

  test('init initializes Hive and opens the box', () async {
    when(mockHiveInterface.init(any)).thenAnswer((realInvocation) {});

    final appDocumentDirectory = await getApplicationDocumentsDirectory();

    // await localServices.init(appDocumentDirectory);
    //
    // verify(localServices.init(appDocumentDirectory)).called(1);
  });
}
