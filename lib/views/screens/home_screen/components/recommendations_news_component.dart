import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';
import 'package:the_daily_journal/view_model/news_cubit/news_cubit.dart';
import 'package:the_daily_journal/view_model/news_cubit/news_states.dart';
import 'package:the_daily_journal/views/widgets/my_circular_progress_indicator.dart';

import '../../../../models/news_model.dart';
import '../../../../utils/constance/gaps.dart';
import '../../../../utils/enums/news_categories.dart';
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
            showButton: false,
          ),
        ),
        Padding(
            padding: paddingH16,
            child:
                BlocBuilder<NewsCubit, NewsState>(buildWhen: (context, state) {
                  if (state is NewsLoadedSuccessfully && state.category == NewsCategories.all) return true;
          return false;
            }, builder: (context, state) {
              if (state is FailedToLoadNews && news.isEmpty) {
                return Text('Error: ${state.message}');
              } else if (state is NewsLoading) {
                return const MyCircularProgressIndicator();
              }
              if (state is NewsLoadedSuccessfully) {
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
