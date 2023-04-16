import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';

import 'light_theme_colors.dart';

ThemeData lightTheme() => ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      color: LightThemeColors.appBarColor,
      elevation: 0.0,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(padding8,),
        iconSize: MaterialStateProperty.all(18.0),
        iconColor: MaterialStateProperty.all(LightThemeColors.iconColor)
      )
      /// TODO: Complete icon button theem
    ),
    iconTheme: const IconThemeData(
      color: LightThemeColors.primaryColor,
    ),
    primaryIconTheme: const IconThemeData(
      color: LightThemeColors.primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: LightThemeColors.bottomNavBackgroundColor,
      elevation: 0.0,
      showSelectedLabels: true,
      selectedItemColor: LightThemeColors.bottomNavSelectedItemColor,
      type: BottomNavigationBarType.shifting,
    ),
    scaffoldBackgroundColor: LightThemeColors.backgroundColor,
    colorScheme: const ColorScheme(
      background: LightThemeColors.backgroundColor,
      onBackground: LightThemeColors.onBackgroundColor,
      brightness: Brightness.light,
      primary: LightThemeColors.primaryColor,
      onPrimary: LightThemeColors.onPrimaryColor,
      error: LightThemeColors.errorColor,
      onError: LightThemeColors.onErrorColor,
      secondary: LightThemeColors.secondaryColor,
      onSecondary: LightThemeColors.onSecondaryColor,
      surface: LightThemeColors.surfaceColor,
      onSurface: LightThemeColors.onSurfaceColor,
    ));
