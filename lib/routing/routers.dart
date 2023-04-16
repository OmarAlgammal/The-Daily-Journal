import 'package:flutter/cupertino.dart';
import 'package:the_daily_journal/views/screens/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:the_daily_journal/views/screens/bookmarks_screen/bookmarks_screen.dart';
import 'package:the_daily_journal/views/screens/display_single_news_screen/display_single_news_screen.dart';
import 'package:the_daily_journal/views/screens/home_screen/home_screen.dart';
import 'package:the_daily_journal/routing/routes.dart';
import 'package:the_daily_journal/views/screens/landing_screen/landing_screen.dart';
import 'package:the_daily_journal/views/screens/profile_screen/profile_screen.dart';
import 'package:the_daily_journal/views/screens/search_screen/search_screen.dart';
import 'package:the_daily_journal/views/screens/sign_up_screen/sign_up_screen.dart';
import 'package:the_daily_journal/views/screens/discover_world_screen/discover_world_screen.dart';

import '../views/screens/sign_in_screen/sign_in_screen.dart';



Map<String, Widget> routes = {
  AppRouts.signInScreen: const SignInScreen(),
  AppRouts.signUpScreen: const SignUpScreen(),
  AppRouts.landingScreen: const LandingScreen(),
  AppRouts.homeScreen: const HomeScreen(),
  AppRouts.displayNewsScreen: const DisplaySingleNewsScreen(),
  AppRouts.bookmarksScreen:  BookmarksScreen(),
  AppRouts.profileScreen: const ProfileScreen(),
  AppRouts.discoverWorldScreen: DiscoverWorldScreen(),
  AppRouts.searchScreen: const SearchScreen(),
};

Route onGenerate(RouteSettings settings) {
  return CupertinoPageRoute(
    settings: settings,
    builder: (context) => routes[settings.name] ?? BottomNavScreen(),
  );
}


