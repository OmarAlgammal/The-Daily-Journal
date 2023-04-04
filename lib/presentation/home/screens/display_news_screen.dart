import 'package:flutter/material.dart';
import 'package:the_daily_journal/presentation/home/components/display_news_screen_component/sliver_app_bar_component.dart';
import 'package:the_daily_journal/presentation/home/components/display_news_screen_component/sliver_list_component.dart';

import '../../../domain/news/entities/news.dart';

class DisplayNewsScreen extends StatelessWidget {
  const DisplayNewsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as News;
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
