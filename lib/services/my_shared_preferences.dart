import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseSharedPreferences {
  Future<void> init();

  Future<void> setBoolData(String key, bool value);

  bool getBoolData(String key);
}

class MySharedPreferences implements BaseSharedPreferences {
  late final SharedPreferences _prefs;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  bool getBoolData(String key) {
    return _prefs.getBool(key)?? false;
  }


  @override
  Future<void> setBoolData(String key, bool value) async {
    await _prefs.setBool(key, value);
  }
}
