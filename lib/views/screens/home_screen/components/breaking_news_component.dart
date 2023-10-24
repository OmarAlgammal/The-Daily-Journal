import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:the_daily_journal/routing/routes.dart';
import 'package:the_daily_journal/utils/enums/news_categories.dart';
import 'package:the_daily_journal/views/widgets/news_list.dart';

import '../../../../models/news_model.dart';
import '../../../../utils/constance/gaps.dart';
import '../../../widgets/breaking_news_item.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NewsTitle(
          title: 'Breaking News',
          allowPadding: true,
        ),
        NewsList(
          newsCategories: NewsCategories.emirates,
          child: (news) => breakingNewsWidget(news),
          showPadding: true,
        ),
      ],
    );
  }

  Widget breakingNewsWidget(List<NewsModel> news) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          items: news
              .map((e) => InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(AppRouts.displayNewsScreen, arguments: e);
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
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: _currentPage == entry.key
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface.withOpacity(.6),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
