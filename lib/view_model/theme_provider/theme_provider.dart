
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_daily_journal/repositories/theme_mode_repository.dart';
import 'package:the_daily_journal/utils/theme/light_theme/light_theme.dart';

import '../../utils/theme/dark_theme/dartk_theme.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeData? _themeData;

  ThemeData themeData (){
    return _themeData ??  (baseLocalUtilsDatabase.themeIsDark() ? darkTheme : lightTheme);
  }

  BaseThemeModeRepository baseLocalUtilsDatabase;

  ThemeProvider(this.baseLocalUtilsDatabase);


  void toggleThemeMode(){
    if (_themeData == lightTheme){
      _themeData = darkTheme;
      baseLocalUtilsDatabase.setDarkThemeValue(value: true);
    }else{
      _themeData = lightTheme;
      baseLocalUtilsDatabase.setDarkThemeValue(value: false);
    }
    notifyListeners();
  }
}