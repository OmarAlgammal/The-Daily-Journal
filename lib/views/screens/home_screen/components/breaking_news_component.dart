import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/routing/routes.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';
import 'package:the_daily_journal/utils/enums/news_categories.dart';
import 'package:the_daily_journal/view_model/news_cubit/news_cubit.dart';
import 'package:the_daily_journal/view_model/news_cubit/news_states.dart';

import '../../../../models/news_model.dart';
import '../../../../utils/constance/gaps.dart';
import '../../../widgets/breaking_news_item.dart';
import '../../../widgets/my_circular_progress_indicator.dart';
import '../../../widgets/news_title.dart';

class BreakingNewsComponent extends StatefulWidget {
  const BreakingNewsComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<BreakingNewsComponent> createState() => _BreakingNewsComponentState();
}

class _BreakingNewsComponentState extends State<BreakingNewsComponent> {
  final _carouselController = CarouselController();

  int _currentPage = 1;
  List<NewsModel> news = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: padding16,
          child: NewsTitle(title: 'Breaking News'),
        ),
        BlocBuilder<NewsCubit, NewsState>(buildWhen: (context, state) {
          if (state is NewsLoadedSuccessfully &&
              state.category == NewsCategories.fromEgypt) return true;
          return false;
        }, builder: (context, state) {
          if (state is FailedToLoadNews && news.isEmpty) {
            return Text('Error: ${state.message}');
          }
          if (state is NewsLoading) {
            return const MyCircularProgressIndicator();
          }
          if (state is NewsLoadedSuccessfully) {
            news = state.news;
          }
          return Column(
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                items: news
                    .map((e) => InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(AppRouts.displayNewsScreen,
                                    arguments: e);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 6),
                            child: BreakingNewsItem(news: e),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  enableInfiniteScroll: false,
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                  height: (MediaQuery.of(context).size.height / 2) * .49,
                  initialPage: 1,
                  viewportFraction: .83,
                ),
              ),
              gap4,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: news.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _carouselController.animateToPage(entry.key),
                    child: Container(
                      width: 18.0,
                      height: 5,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: _currentPage == entry.key
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(.6),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        }),
      ],
    );
  }
}
