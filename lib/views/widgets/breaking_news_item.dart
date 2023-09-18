import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/extensions/screen_dimens.dart';
import 'package:the_daily_journal/views/widgets/my_cached_image_network.dart';

import '../../models/news_model.dart';
import '../../utils/constance/gaps.dart';
import '../../utils/helpers/date_factory.dart';
import '../../utils/theme/colors.dart';
import 'authentication_mark.dart';

class BreakingNewsItem extends StatelessWidget {
  const BreakingNewsItem({Key? key, required this.news}) : super(key: key);

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(.8),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(
                    0,
                    1,
                  ) // Changes position of shadow
                )
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Opacity(
              opacity: .5,
              child: MyCachedImageNetwork(url: news.imageUrl,),
            ),
          ),
        ),
        Positioned(
          left: 18,
          top: 18,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                news.category,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                maxLines: 2,
              ),
            ),
          ),
        ),
        Positioned(
          left: 18,
          bottom: 18,
          right: 18,
          child: SizedBox(
            width: context.screenWidth() * 1.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(news.sourceName,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                        maxLines: 2),
                    gap8,
                    const AuthenticationMark(),
                    gap8,
                    Text(
                      DateFactory.calculateElapsedTime(
                          date: news.publishedDate),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.onBackground,
                            //color: whiteColor,
                          ),
                    )
                  ],
                ),
                gap4,
                Text(
                  news.title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground
                      //color: whiteColor,
                      ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
