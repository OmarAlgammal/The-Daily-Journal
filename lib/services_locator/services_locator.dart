import 'package:get_it/get_it.dart';
import 'package:the_daily_journal/database/local_database.dart';
import 'package:the_daily_journal/database/news_database.dart';
import 'package:the_daily_journal/services/firebase_auth_service.dart';
import 'package:the_daily_journal/services/local_services.dart';
import 'package:the_daily_journal/services/news_services.dart';
import 'package:the_daily_journal/view_model/auth_cubit/auth_cubit.dart';
import 'package:the_daily_journal/view_model/bookmarks_cubit/bookmark_cubit.dart';
import 'package:the_daily_journal/view_model/categories_news_cubit/categories_cubit.dart';
import 'package:the_daily_journal/view_model/query_news_cubit/query_news_cubit.dart';

GetIt sl = GetIt.instance;

void setup() {
  sl.registerSingleton(FirebaseAuthentication());
  sl.registerSingleton(NewsServices());
  sl.registerSingleton(NewsDatabase(sl<NewsServices>()));
  sl.registerLazySingleton(() => LocalServices());
  sl.registerLazySingleton(() => LocalDatabase(sl<LocalServices>()));

  sl.registerSingleton(QueryNewsCubit(sl<NewsDatabase>()));
  sl.registerSingleton(AuthCubit(sl<FirebaseAuthentication>()));
  sl.registerSingleton(CategoriesCubit(sl<NewsDatabase>()));
  sl.registerSingleton(BookmarkCubit(sl<LocalDatabase>()));
}
