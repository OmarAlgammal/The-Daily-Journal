import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_daily_journal/utils/constance/padding/padding.dart';
import 'package:the_daily_journal/utils/theme/dark_theme/dark_theme_colors.dart';

ThemeData darkTheme() => ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      color: DarkThemeColors.appBarColor,
      elevation: 0.0,
    ),
    dividerTheme: DividerThemeData(
      color: DarkThemeColors.dividerColor
    ),
    textTheme: TextTheme(
      bodySmall:     const TextStyle(color: DarkThemeColors.bodySmallColor),
      bodyMedium:    const TextStyle(color: DarkThemeColors.bodySmallColor),
      bodyLarge:     const TextStyle(color: DarkThemeColors.bodySmallColor),
      displaySmall:  const TextStyle(color: DarkThemeColors.bodySmallColor),
      displayMedium: const TextStyle(color: DarkThemeColors.bodySmallColor),
      displayLarge:  const TextStyle(color: DarkThemeColors.bodySmallColor),
      titleSmall:    const TextStyle(color: DarkThemeColors.bodySmallColor),
      titleMedium:   const TextStyle(color: DarkThemeColors.bodySmallColor),
      titleLarge:    const TextStyle(color: DarkThemeColors.bodySmallColor),
      headlineSmall:    const TextStyle(color: DarkThemeColors.bodySmallColor),
      headlineMedium:    const TextStyle(color: DarkThemeColors.bodySmallColor),
      headlineLarge:    const TextStyle(color: DarkThemeColors.bodySmallColor),
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
              padding8,
            ),
            iconSize: MaterialStateProperty.all(18.0),
            iconColor: MaterialStateProperty.all(DarkThemeColors.iconColor))

        /// TODO: Complete icon button theme
        ),
    iconTheme: const IconThemeData(
      color: DarkThemeColors.primaryColor,
    ),
    primaryIconTheme: const IconThemeData(
      color: DarkThemeColors.primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: DarkThemeColors.bottomNavBackgroundColor,
      elevation: 0.0,
      showSelectedLabels: true,
      selectedItemColor: DarkThemeColors.bottomNavSelectedItemColor,
      type: BottomNavigationBarType.shifting,
    ),
    scaffoldBackgroundColor: DarkThemeColors.backgroundColor,

    colorScheme: const ColorScheme(
      background: DarkThemeColors.backgroundColor,
      onBackground: DarkThemeColors.onBackgroundColor,
      brightness: Brightness.light,
      primary: DarkThemeColors.primaryColor,
      onPrimary: DarkThemeColors.onPrimaryColor,
      error: DarkThemeColors.errorColor,
      onError: DarkThemeColors.onErrorColor,
      secondary: DarkThemeColors.secondaryColor,
      onSecondary: DarkThemeColors.onSecondaryColor,
      surface: DarkThemeColors.surfaceColor,
      onSurface: DarkThemeColors.onSurfaceColor,
    ));
