import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/enums/news_categories.dart';
import 'package:the_daily_journal/views/screens/search_screen/components/search_screen_appbar_component.dart';
import 'package:the_daily_journal/views/widgets/news_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchScreenAppBarComponent(),
      body: const NewsList(newsCategories: NewsCategories.search),
    );
  }
}
