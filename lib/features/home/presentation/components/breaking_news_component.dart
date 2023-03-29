import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../shared/constance/colors.dart';
import '../../../../shared/constance/gaps.dart';
import '../../../../shared/widgets/breaking_news_item.dart';
import '../../domain/entities/news.dart';

class BreakingNewsComponent extends StatelessWidget {
  BreakingNewsComponent({Key? key, required this.news}) : super(key: key);

  final List<News> news;
  final _pageViewController =
      PageController(initialPage: 1, keepPage: true, viewportFraction: .9);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: (MediaQuery.of(context).size.height / 2) * .6,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageViewController,
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: BreakingNewsItem(
                  news: news[index],
                ),
              );
            },
          ),
        ),
        if (news.length > 1)
          Column(
            children: [
              gap12,
              SmoothPageIndicator(
                controller: _pageViewController,
                count: news.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 6.0,
                  dotWidth: 6.0,
                  radius: 2.0,
                  activeDotColor: Colors.blue,
                  dotColor: brightGreyColor,
                  expansionFactor: 4,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
