
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_daily_journal/repositories/theme_mode_repository.dart';
import 'package:the_daily_journal/utils/theme/light_theme/light_theme.dart';

import '../../utils/theme/dark_theme/dartk_theme.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeData? _themeData;


  ThemeData get themeData =>
  _themeData ?? (_baseThemeModeRepository.themeIsDark() ? darkTheme : lightTheme);


  BaseThemeModeRepository _baseThemeModeRepository;

  ThemeProvider(this._baseThemeModeRepository);


  void toggleThemeMode(){
    if (_themeData == lightTheme){
      _themeData = darkTheme;
      _baseThemeModeRepository.setDarkThemeValue(value: true);
    }else{
      _themeData = lightTheme;
      _baseThemeModeRepository.setDarkThemeValue(value: false);
    }
    notifyListeners();
  }
}