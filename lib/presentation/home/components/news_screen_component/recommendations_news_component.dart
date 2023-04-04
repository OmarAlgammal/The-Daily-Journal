import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_daily_journal/core/utils/extensions/screen_dimens.dart';
import 'package:the_daily_journal/presentation/news/screens/display_news_screen.dart';
import 'package:the_daily_journal/routing/routes.dart';

import '../../../../domain/news/entities/news.dart';
import '../../../../shared/constance/gaps.dart';
import '../../../../shared/widgets/news_title.dart';
import '../../../../shared/widgets/recommendation_news_item.dart';
import '../../../../shared/widgets/recommendations_news_item.dart';

class RecommendationsNewsComponent extends StatelessWidget {
  const RecommendationsNewsComponent({Key? key, required this.news}) : super(key: key);

  final List<News> news;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: NewsTitle(
            title: 'Recommendations',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: news.length,
            separatorBuilder: (context, index) => gap16,
            itemBuilder: (context, index) => RecommendationsNewsItem(news: news[index]),
          ),
        ),
      ],
    );
  }
}


