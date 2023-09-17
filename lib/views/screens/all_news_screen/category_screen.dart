import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/models/news_model.dart';
import 'package:the_daily_journal/utils/constance/gaps.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';
import 'package:the_daily_journal/utils/enums/news_categories.dart';
import 'package:the_daily_journal/view_model/news_cubit/news_cubit.dart';
import 'package:the_daily_journal/view_model/news_cubit/news_states.dart';
import 'package:the_daily_journal/views/widgets/my_circular_progress_indicator.dart';
import 'package:the_daily_journal/views/widgets/news_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
    this._category, {
    Key? key,
  }) : super(key: key);
  final NewsCategories _category;

  @override
  Widget build(BuildContext context) {
    NewsCubit.instance(context).fetchNewsByCategory(category: _category);
    List<NewsModel> news = [];
    return BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
      if (state is NewsLoading) {
        return const MyCircularProgressIndicator();
      }
      if (state is FailedToLoadNews) {
        return const Text('Failed to load news');
      }

      if (state is NewsLoadedSuccessfully) {
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
