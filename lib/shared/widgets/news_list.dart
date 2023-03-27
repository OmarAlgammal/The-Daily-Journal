import 'package:flutter/material.dart';
import 'package:the_daily_journal/features/home/domain/entities/news.dart';
import 'package:the_daily_journal/shared/widgets/news_item.dart';

import '../constance/gaps.dart';

class NewsList extends StatelessWidget {
  NewsList({Key? key, required this.news,}) : super(key: key);

  List<News> news;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: news.length,
      separatorBuilder: (context, index) => gap16,
      itemBuilder: (context, index) => NewsItem(news: news[index]),
    );
  }
}
