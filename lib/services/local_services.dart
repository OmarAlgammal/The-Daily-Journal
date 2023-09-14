import 'package:hive_flutter/adapters.dart';

import '../models/news_model.dart';

abstract class BaseLocalServices {
  Future<void> init();

  Future<void> writeData(String key, NewsModel value);

  Box<NewsModel> getBox();

  Future<void> delete(String key);

  bool checkSave(String key);

}

class LocalServices implements BaseLocalServices {
  late Box<NewsModel> _box;
  final _categoriesBox = 'CategoriesBox';

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_categoriesBox);
  }

  @override
  Future<void> writeData(String key, NewsModel value) async {
    await _box.put(key, value);
  }

  @override
  Box<NewsModel> getBox() {
    return _box;
  }

  bool checkSave(String key){
    return _box.get(key) != null;
  }

  @override
  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  Future<void> closeBox() async{
    await _box.close();
  }
}
