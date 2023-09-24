

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mockito/mockito.dart';
import 'package:the_daily_journal/models/news_model.dart';
import 'package:the_daily_journal/services/local_services.dart';

import '../mock_helpers/mock_generations.mocks.dart';

void main(){

  late final MockHiveInterface mockHiveInterface;
  late final MockBox mockBox;
  late final LocalServices localServices;
  setUp(() {
    mockBox = MockBox();
    mockHiveInterface = MockHiveInterface();
    localServices = LocalServices(mockHiveInterface);
  });

  test('init initializes Hive and opens the box', () async {

    when(mockHiveInterface.openBox(any)).thenAnswer((_) async => mockBox);

    await localServices.init();

    verify(localServices.init()).called(1);


  });

}