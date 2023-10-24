import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:the_daily_journal/services/news_services.dart';

@GenerateMocks([
  NewsService,
  Dio,
])
void main() {}
