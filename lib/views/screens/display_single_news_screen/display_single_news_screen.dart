import 'package:flutter/material.dart';
import 'package:the_daily_journal/views/screens/display_single_news_screen/components/sliver_app_bar_component.dart';

import '../../../models/news_model.dart';
import 'components/sliver_list_component.dart';

class DisplaySingleNewsScreen extends StatelessWidget {
  const DisplaySingleNewsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as NewsModel;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarComponent(news: news),
          SliverListComponent(news: news),
        ],
      ),
    );
  }
}
