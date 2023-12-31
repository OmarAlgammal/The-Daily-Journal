import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:the_daily_journal/models/news_model.dart';
import 'package:the_daily_journal/repositories/theme_mode_repository.dart';
import 'package:the_daily_journal/routing/routers.dart';
import 'package:the_daily_journal/routing/routes.dart';
import 'package:the_daily_journal/services/local_services.dart';
import 'package:the_daily_journal/services_locator/services_locator.dart';
import 'package:the_daily_journal/utils/enums/news_categories.dart';
import 'package:the_daily_journal/view_model/auth_cubit/auth_cubit.dart';
import 'package:the_daily_journal/view_model/bookmarks_cubit/bookmark_cubit.dart';
import 'package:the_daily_journal/view_model/news_cubit/news_cubit.dart';
import 'package:the_daily_journal/view_model/theme_provider/theme_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Hive.registerAdapter(NewsModelAdapter());

  setup();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    sl<LocalServices>().init();
    super.initState();
  }

  @override
  void dispose() {
    sl<LocalServices>().closeBox();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<NewsCubit>()
          ..fetchNewsByCategory(category: NewsCategories.emirates)
            ..fetchNewsByCategory(category: NewsCategories.all),
        ),
        BlocProvider(create: (context) => sl<BookmarkCubit>()),
      ],
      child: ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(sl<ThemeModeRepository>()),
        child: Builder(
          /// TODO: Refactor app colors in dark theme
          builder: (context) => MaterialApp(
            onGenerateRoute: onGenerate,
            initialRoute: AppRouts.landingScreen,
            debugShowCheckedModeBanner: false,
            theme: Provider.of<ThemeProvider>(context).themeData(),
            //home: BottomNavScreen(),
          ),
        ),
      ),
    );
  }
}
