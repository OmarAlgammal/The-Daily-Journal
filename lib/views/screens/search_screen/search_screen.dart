import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/models/news_model.dart';
import 'package:the_daily_journal/utils/constance/gaps.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';
import 'package:the_daily_journal/view_model/news_cubit/news_cubit.dart';
import 'package:the_daily_journal/view_model/news_cubit/news_states.dart';
import 'package:the_daily_journal/views/screens/search_screen/components/search_screen_appbar_component.dart';
import 'package:the_daily_journal/views/widgets/my_circular_progress_indicator.dart';
import 'package:the_daily_journal/views/widgets/news_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NewsModel> news = [];
    return Scaffold(
      appBar: SearchScreenAppBarComponent(),
      body: BlocBuilder<NewsCubit, NewsState>(
        /// Todo: Use build when function
        builder: (context, state) {
          if (state is NewsLoading) {
            return const MyCircularProgressIndicator();
          }
          if (state is FailedToLoadNews) {
            return const Text('Failed to load search results');
          }

          if (state is NewsLoadedSuccessfully) {
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
