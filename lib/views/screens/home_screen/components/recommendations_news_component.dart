import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';

import '../../../../models/news_model.dart';
import '../../../../utils/constance/gaps.dart';
import '../../../widgets/news_list.dart';
import '../../../widgets/news_title.dart';
import '../../../widgets/recommendation_news_item.dart';

class RecommendationsNewsComponent extends StatelessWidget {
  const RecommendationsNewsComponent({Key? key, required this.news})
      : super(key: key);

  final List<NewsModel> news;

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
          padding: paddingH16,
          child: NewsList(news: news),
        ),
      ],
    );
  }
}
