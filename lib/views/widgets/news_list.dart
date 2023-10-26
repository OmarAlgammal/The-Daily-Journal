import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/core/network/erorrs/server_failure.dart';

import '../../models/news_model.dart';
import '../../utils/constance/gaps.dart';
import '../../utils/constance/padding/app_padding.dart';
import '../../utils/enums/news_categories.dart';
import '../../view_model/news_cubit/news_cubit.dart';
import '../../view_model/news_cubit/news_states.dart';
import 'my_circular_progress_indicator.dart';
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
        buildWhen: (context, state){
          if (state is NewsLoadedSuccessfully && category == state.category) return true;
          return false;
        },
        builder: (context, state) {
          if (state is NewsLoadedSuccessfully) {
            return child?.call(state.news) ??
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      NewsItem(news: state.news[index], showBookmark: false),
                  separatorBuilder: (context, index) => gap12,
                  itemCount: state.news.length,
                );
          }

          if (state is NoInternetConnection) {
            return const SizedBox(
                height: 56,
                width: 56,
                child: Icon(Icons.signal_wifi_connected_no_internet_4));
          }
          if (state is FailedToLoadNews) {
            return Text('Error: ${state.message}');
          }

          return const MyCircularProgressIndicator();
        },
      ),
    );
  }
}
