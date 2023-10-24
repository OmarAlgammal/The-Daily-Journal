
import 'package:hive/hive.dart';
import 'package:the_daily_journal/services/local_services.dart';

import '../models/news_model.dart';

abstract class BaseLocalDatabase{
  Future<void> createBookmark(String key, NewsModel value);

  Box<NewsModel> getBookmarksBox();

  Future<void> deleteBookmark(String key);

  bool saveVerification(String key);
}

class LocalDatabase implements BaseLocalDatabase{

  final BaseLocalServices _baseLocalServices;

  LocalDatabase(this._baseLocalServices);

  @override
  Future<void> deleteBookmark(String key) async{
    await _baseLocalServices.delete(key);
  }

  @override
  Box<NewsModel> getBookmarksBox() {
    return _baseLocalServices.getBox();
  }

  @override
  Future<void> createBookmark(String key, NewsModel value) async{
    _baseLocalServices.writeData(key, value);
  }

  @override
  bool saveVerification(String key) {
    return _baseLocalServices.saveVerification(key);
  }


}