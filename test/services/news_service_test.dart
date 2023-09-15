

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_daily_journal/services/news_service.dart';

import '../mock_helpers/mock_generations.mocks.dart';

void main(){

  late final NewsService newsService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    newsService = NewsService(mockDio);
  });


  group(description, () { })
  
}