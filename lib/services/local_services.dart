import 'package:hive_flutter/adapters.dart';

import '../models/news_model.dart';

abstract class BaseLocalServices {
  Future<void> init();

  Future<void> writeData(String key, NewsModel value);

  Box<NewsModel> getBox();

  Future<void> delete(String key);

  bool saveVerification(String key);
}

class LocalServices implements BaseLocalServices {
  late final HiveInterface _hive;
  late final Box<NewsModel> _box;
  final _categoriesBoxName = 'Categories-box';

  LocalServices(
    this._hive,
  );

  @override
  Future<void> init() async {
    await _hive.initFlutter();
    _box = await _hive.openBox(_categoriesBoxName);
  }

  @override
  Future<void> writeData(String key, NewsModel value) async {
    await _box.put(key, value);
  }

  @override
  Box<NewsModel> getBox() {
    return _box;
  }

  @override
  bool saveVerification(String key) {
    return _box.get(key) != null;
  }

  @override
  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  Future<void> closeBox() async {
    await _box.close();
  }
}
