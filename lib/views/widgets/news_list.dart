import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/utils/extensions/context_extension.dart';

import '../../models/news_model.dart';
import '../../utils/constance/gaps.dart';
import '../../utils/constance/padding/app_padding.dart';
import '../../utils/enums/news_categories.dart';
import '../../view_model/news_cubit/news_cubit.dart';
import '../../view_model/news_cubit/news_states.dart';
import 'news_item.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
    required this.category,
    this.child,
    this.usePadding = true,
  });

  final NewsCategories category;
  final bool usePadding;
  final Widget? Function(List<NewsModel> news)? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: usePadding ? AppPadding.screenPadding : EdgeInsets.zero,
      child: BlocBuilder<NewsCubit, NewsState>(
        buildWhen: (context, state) {
          debugPrint('state is $state');
          if (state.category == category) return true;
          return false;
        },
        builder: (context, state) {
          if (state is NewsLoadedSuccessfully) {
            return child?.call(state.news) ??
                ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      NewsItem(news: state.news[index], showBookmark: false),
                  separatorBuilder: (context, index) => gap12,
                  itemCount: state.news.length,
                );
          }

          if (state is FailedToLoadNews) {
            return Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (state.icon != null) Icon(state.icon, size: 56,),
                    gap8,
                    Text(state.message, style: context.textTheme.titleLarge,),
                  ],
                ),
              ),
            );
          }

          return const Center(
            child: SizedBox.square(
                dimension: 36, child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
