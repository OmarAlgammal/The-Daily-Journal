import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/models/news_model.dart';
import 'package:the_daily_journal/utils/constance/gaps.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';
import 'package:the_daily_journal/view_model/query_news_cubit/query_news_cubit.dart';
import 'package:the_daily_journal/view_model/query_news_cubit/query_news_states.dart';
import 'package:the_daily_journal/views/screens/search_screen/components/search_screen_appbar_component.dart';
import 'package:the_daily_journal/views/widgets/my_circular_progress_indicator.dart';
import 'package:the_daily_journal/views/widgets/news_item.dart';

import '../../../utils/constance/icons.dart';
import '../../widgets/circular_icon.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NewsModel> news = [];
    return Scaffold(
      appBar: SearchScreenAppBarComponent(),
      body: BlocBuilder<QueryNewsCubit, QueryNewsState>(
        /// TODO: Use build when function
        builder: (context, state) {
          if (state is QueryNewsLoading) {
            return const MyCircularProgressIndicator();
          }
          if (state is FailedToLoadQueryResults) {
            return const Text('Failed to load search results');
          }

          if (state is QueryNewsLoadedSuccessfully) {
            news.clear();
            news = state.news;
          }

          if (news.isEmpty) {
            return Center(
              child: Text(
                'Search articles in The Daily Journal',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          }
          return ListView.separated(
            padding: padding16,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => NewsItem(news: news[index]),
            separatorBuilder: (context, index) => gap8,
            itemCount: news.length,
          );
        },
      ),
    );
  }
}
