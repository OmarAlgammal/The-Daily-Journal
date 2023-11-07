import '../services/my_shared_preferences.dart';

abstract class BaseThemeModeRepository {
  bool themeIsDark();

  Future<void> setDarkThemeValue({required bool value});
}

class ThemeModeRepository implements BaseThemeModeRepository {
  final BaseSharedPreferences _prefs;

  final String _themeModelKey = 'Dark-theme';

  ThemeModeRepository(this._prefs);

  @override
  Future<void> setDarkThemeValue({required bool value}) async {
    await _prefs.setBoolData(_themeModelKey, value);
  }

  @override
  bool themeIsDark() {
    return _prefs.getBoolData(_themeModelKey);
  }
}
