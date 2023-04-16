
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_daily_journal/utils/theme/light_theme/light_theme.dart';

import '../../utils/theme/dark_theme/dartk_theme.dart';

class ThemeProvider extends ChangeNotifier{

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get themeData => _isDarkMode ? darkTheme() : lightTheme();

  void toggleThemeMode(){
    _isDarkMode = ! _isDarkMode;
    notifyListeners();
  }
}