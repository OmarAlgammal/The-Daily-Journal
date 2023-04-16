import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';
import 'package:the_daily_journal/view_model/categories_news_cubit/categories_states.dart';
import 'package:the_daily_journal/views/widgets/my_circular_progress_indicator.dart';

import '../../../models/news_model.dart';
import '../../../utils/constance/gaps.dart';
import '../../../view_model/categories_news_cubit/categories_cubit.dart';
import '../../widgets/news_item.dart';

class TechnologyScreen extends StatefulWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  State<TechnologyScreen> createState() => _TechnologyScreenState();
}

class _TechnologyScreenState extends State<TechnologyScreen> {
  @override
  void initState() {
    CategoriesCubit.instance(context).getTechnologyNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<NewsModel> news = [];
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is Loading) {
          return const MyCircularProgressIndicator();
        } else if (state is Failed && news.isEmpty) {
          return const Center(child: Text('Failed to load news'));
        }

        if (state is TechnologyCategoryLoadedSuccessfully) {
          news = state.news;
        }

        return ListView.separated(
          padding: padding16,
          itemBuilder: (context, index) => NewsItem(news: news[index]),
          separatorBuilder: (context, index) => gap8,
          itemCount: news.length,
        );
      },
    );
  }
}
