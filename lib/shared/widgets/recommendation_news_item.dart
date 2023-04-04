import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_daily_journal/core/utils/extensions/screen_dimens.dart';

import '../../domain/news/entities/news.dart';
import '../../routing/routes.dart';
import '../constance/gaps.dart';

class RecommendationsNewsItem extends StatelessWidget {
  const RecommendationsNewsItem({Key? key, required this.news})
      : super(key: key);

  final News news;

  /// height: 108, width: 112
  @override
  Widget build(BuildContext context) {
    final newsImageHeight = context.screenHeight() / 7.2;
    final newsImageWidth = context.screenWidth() / 3.5;
    final  authorImageRadius = context.screenWidth() / 34;
    return InkWell(
      onTap: (){
        Navigator.of(context, rootNavigator: true).pushNamed(AppRouts.displayNewsScreen, arguments: news,);
      },
      child: SizedBox(
        height: newsImageHeight,
        width: newsImageWidth,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                news.imageUrl,
                fit: BoxFit.cover,
                height: newsImageHeight,
                width: newsImageWidth,
              ),
            ),
            gap12,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // category
                  Text(
                    news.category,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  // title
                  Text(
                    news.title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: authorImageRadius,
                        backgroundImage: NetworkImage(
                          news.authorImageUrl,
                        ),
                      ),
                      gap4,
                      Text(
                        news.authorName,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.grey),
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 2,
                      ),
                      gap4,
                      Text(
                        DateFormat.MMMd()
                            .add_y()
                            .format(DateTime.now())
                            .toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}