import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/enums/news_categories.dart';

class ChipController with ChangeNotifier {
  /// TODO: Refactor chip controller
  int _chipIndex = 0;

  static ChipController instance(BuildContext context) =>
      Provider.of<ChipController>(context, listen: false);

  final List<NewsCategories> tabs;

  ChipController({required this.tabs});

  int get chipIndex => _chipIndex;

  void changeChipIndex(int index) {
    _chipIndex = index;
    notifyListeners();
  }
}
