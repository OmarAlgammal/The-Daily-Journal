import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_daily_journal/shared/theme/colors.dart';
import 'package:the_daily_journal/shared/theme/light_theme/light_theme_color.dart';

ThemeData lightTheme() => ThemeData(
    appBarTheme: AppBarTheme(
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
        padding: MaterialStateProperty.all(EdgeInsets.all(8.0),),
        iconSize: MaterialStateProperty.all(18.0),
        iconColor: MaterialStateProperty.all(LightThemeColors.iconColor)
      )
      /// TODO: Complete icon button theem
    ),
    iconTheme: IconThemeData(
      color: LightThemeColors.primaryColor,
    ),
    primaryIconTheme: IconThemeData(
      color: LightThemeColors.primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: LightThemeColors.bottomNavBackgroundColor,
      elevation: 0.0,
      showSelectedLabels: true,
      selectedItemColor: LightThemeColors.bottomNavSelectedItemColor,
      type: BottomNavigationBarType.shifting,
    ),
    colorScheme: ColorScheme(
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
