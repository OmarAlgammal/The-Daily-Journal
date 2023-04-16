import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/models/news_model.dart';
import 'package:the_daily_journal/utils/constance/gaps.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';
import 'package:the_daily_journal/view_model/categories_news_cubit/categories_cubit.dart';
import 'package:the_daily_journal/view_model/query_news_cubit/query_news_cubit.dart';
import 'package:the_daily_journal/view_model/query_news_cubit/query_news_states.dart';

import 'package:the_daily_journal/views/widgets/my_circular_progress_indicator.dart';
import 'package:the_daily_journal/views/widgets/news_item.dart';

class AllNewsScreen extends StatelessWidget {
  const AllNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QueryNewsCubit.instance(context).getAllNews();
    List<NewsModel> news = [];
    return BlocBuilder<QueryNewsCubit, QueryNewsState>(builder: (context, state) {
      if (state is FailedToLoadQueryNews && news.isEmpty) {
        return Text('Error: ${state.message}');
      } else if (state is AllNewsLoading && news.isEmpty) {
        return const MyCircularProgressIndicator();
      }
      if (state is AllNewsLoadedSuccessfully) {
        news = state.news;
      }
      return ListView.separated(
        padding: padding16,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => NewsItem(
          news: news[index],
        ),
        separatorBuilder: (context, index) => gap12,
        itemCount: news.length,
      );
    });
  }
}
