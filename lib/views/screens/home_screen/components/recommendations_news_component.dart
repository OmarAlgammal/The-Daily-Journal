import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/constance/padding/padding.dart';
import 'package:the_daily_journal/views/widgets/news_list.dart';

import '../../../../utils/enums/news_categories.dart';
import '../../../widgets/news_title.dart';

class RecommendationsNewsComponent extends StatelessWidget {
  const RecommendationsNewsComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NewsTitle(
          title: 'Recommendations',
          showButton: false,
          allowPadding: true,
        ),
        Padding(
            padding: paddingH16,
            child: NewsList(
              newsCategories: NewsCategories.all,
            )),
      ],
    );
  }
}
