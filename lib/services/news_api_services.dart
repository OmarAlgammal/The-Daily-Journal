import 'package:dartz/dartz.dart';
import 'package:the_daily_journal/core/network/erorrs/server_failure.dart';

import '../models/news_model.dart';

abstract class BaseNewsApiServices {
  Future<Either<ServerFailure, NewsModel>> getNews();
}
