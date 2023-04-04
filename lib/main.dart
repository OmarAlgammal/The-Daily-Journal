import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/presentation/bookmarks/bookmarks_cubit/bookmark_cubit.dart';
import 'package:the_daily_journal/routing/routers.dart';
import 'package:the_daily_journal/routing/routes.dart';
import 'package:the_daily_journal/shared/theme/light_theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BookmarkCubit()),
      ],
      child: MaterialApp(
        onGenerateRoute: onGenerate,
        initialRoute: AppRouts.bottomNavScreen,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme(),
        //home: BottomNavScreen(),
      ),
    );
  }
}
