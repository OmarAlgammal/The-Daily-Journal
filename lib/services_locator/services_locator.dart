import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:the_daily_journal/repositories/local_repository.dart';
import 'package:the_daily_journal/repositories/news_repository.dart';
import 'package:the_daily_journal/repositories/theme_mode_repository.dart';
import 'package:the_daily_journal/services/firebase_auth_service.dart';
import 'package:the_daily_journal/services/local_services.dart';
import 'package:the_daily_journal/services/news_service.dart';
import 'package:the_daily_journal/view_model/auth_cubit/auth_cubit.dart';
import 'package:the_daily_journal/view_model/bookmarks_cubit/bookmark_cubit.dart';
import 'package:the_daily_journal/view_model/news_cubit/news_cubit.dart';

import '../core/network/api_constance.dart';
import '../services/my_shared_preferences.dart';

GetIt sl = GetIt.instance;

void setup() {
  sl.registerSingleton(FirebaseAuth.instance);
  sl.registerSingleton(GoogleSignIn());
  sl.registerSingleton(GoogleAuthProviderWrapper());
  sl.registerSingleton(FirebaseAuthentication(sl(), sl(), sl()));
  sl.registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: ApiConstance.baseUrl)));
  sl.registerSingleton(NewsService(sl()));
  sl.registerSingleton(NewsRepository(sl<NewsService>()));
  sl.registerLazySingleton(() => Hive);
  sl.registerLazySingleton(() => LocalServices(sl(),));
  sl.registerSingleton(MySharedPreferences());

  sl.registerSingleton(ThemeModeRepository(sl<MySharedPreferences>()));
  sl.registerLazySingleton(() => LocalDatabase(sl<LocalServices>()));

  sl.registerSingleton(AuthCubit(sl<FirebaseAuthentication>()));
  sl.registerSingleton(NewsCubit(sl<NewsRepository>()));
  sl.registerSingleton(BookmarkCubit(sl<LocalDatabase>()));
}
