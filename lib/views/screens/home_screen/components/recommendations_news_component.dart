import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';
import 'package:the_daily_journal/view_model/query_news_cubit/query_news_cubit.dart';
import 'package:the_daily_journal/views/widgets/my_circular_progress_indicator.dart';

import '../../../../models/news_model.dart';
import '../../../../utils/constance/gaps.dart';
import '../../../../view_model/query_news_cubit/query_news_states.dart';
import '../../../widgets/news_item.dart';
import '../../../widgets/news_title.dart';

class RecommendationsNewsComponent extends StatelessWidget {
  const RecommendationsNewsComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NewsModel> news = [];
    return Column(
      children: [
        const Padding(
          padding: padding16,
          child: NewsTitle(
            title: 'Recommendations',
          ),
        ),
        Padding(
            padding: paddingH16,
            child: BlocBuilder<QueryNewsCubit, QueryNewsState>(
                builder: (context, state) {
              if (state is FailedToLoadQueryNews && news.isEmpty) {
                return Text('Error: ${state.message}');
              } else if (state is AllNewsLoading) {
                return const MyCircularProgressIndicator();
              }
              if (state is AllNewsLoadedSuccessfully) {
                news = state.news;
              }
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    NewsItem(news: news[index], showBookmark: false),
                separatorBuilder: (context, index) => gap12,
                itemCount: news.length,
              );
            })),
      ],
    );
  }
}
