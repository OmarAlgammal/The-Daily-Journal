import 'package:flutter/cupertino.dart';
import 'package:the_daily_journal/presentation/bottom_nav/screens/bottom_nav_screen.dart';
import 'package:the_daily_journal/presentation/bookmarks/screens/bookmarks_screen.dart';
import 'package:the_daily_journal/presentation/home/screens/display_news_screen.dart';
import 'package:the_daily_journal/presentation/home/screens/home_screen.dart';
import 'package:the_daily_journal/routing/routes.dart';



Map<String, Widget> routes = {
  AppRouts.homeScreen: const HomeScreen(),
  AppRouts.displayNewsScreen: const DisplayNewsScreen(),
  AppRouts.bookmarksScreen: const BookmarksScreen(),
};

Route onGenerate(RouteSettings settings) {
  return CupertinoPageRoute(
    settings: settings,
    builder: (context) => routes[settings.name] ?? BottomNavScreen(),
  );
}


