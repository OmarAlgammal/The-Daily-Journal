import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/news_model.dart';
import '../../../utils/constance/gaps.dart';
import '../../../utils/constance/padding.dart';
import '../../../view_model/categories_news_cubit/categories_cubit.dart';
import '../../../view_model/categories_news_cubit/categories_states.dart';
import '../../widgets/my_circular_progress_indicator.dart';
import '../../widgets/news_item.dart';

class GeneralNewsScreen extends StatefulWidget {
  const GeneralNewsScreen({Key? key}) : super(key: key);

  @override
  State<GeneralNewsScreen> createState() => _GeneralNewsScreenState();
}

class _GeneralNewsScreenState extends State<GeneralNewsScreen> {
  @override
  void initState() {
    CategoriesCubit.instance(context).getGeneralNews();
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

        if (state is GeneralCategoryLoadedSuccessfully) {
          news = state.news;
        }

        return ListView.separated(
          padding: padding16,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => NewsItem(news: news[index]),
          separatorBuilder: (context, index) => gap8,
          itemCount: news.length,
        );
      },
    );
  }
}
