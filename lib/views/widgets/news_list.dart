import 'package:flutter/material.dart';
import 'package:the_daily_journal/views/widgets/recommendation_news_item.dart';

import '../../models/news_model.dart';
import '../../utils/constance/gaps.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key, required this.news}) : super(key: key);

  final List<NewsModel> news;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: news.length,
      separatorBuilder: (context, index) => gap16,
      itemBuilder: (context, index) =>
          RecommendationsNewsItem(news: news[index]),
    );
  }
}
