import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/constance/icons.dart';
import 'package:the_daily_journal/utils/extensions/context_extension.dart';
import 'package:the_daily_journal/utils/helpers/date_factory.dart';
import 'package:the_daily_journal/view_model/bookmarks_cubit/bookmark_cubit.dart';
import 'package:the_daily_journal/views/widgets/my_cached_network_image.dart';

import '../../models/news_model.dart';
import '../../routing/routes.dart';
import '../../utils/constance/gaps.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key, required this.news, this.showBookmark = false})
      : super(key: key);

  final NewsModel news;
  final bool showBookmark;

  @override
  Widget build(BuildContext context) {
    final newsImageHeight = context.screenHeight() / 7.2;
    final newsImageWidth = context.screenWidth() / 3.5;
    final authorImageRadius = context.screenWidth() / 34;
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
          AppRouts.displayNewsScreen,
          arguments: news,
        );
      },
      child: SizedBox(
        height: newsImageHeight,
        width: newsImageWidth,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: MyCachedNetworkImage(
                imageUrl: news.imageUrl,
                width: newsImageWidth,
                height: newsImageHeight,
              ),
            ),
            gap12,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // category
                  Row(
                    children: [
                      Text(
                        news.category,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      const Spacer(),
                      if (showBookmark)
                        InkWell(
                          onTap: () {
                            BookmarkCubit.instance(context)
                                .deleteBookmark(news.title);
                          },
                          child: const Icon(
                            AppIcons.bookmarkIcon,
                          ),
                        )
                    ],
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
                      MyCachedNetworkImage(
                        imageUrl: news.authorImageUrl,
                        imageBuilder: (context, imageProvider) =>
                            CircleAvatar(radius: authorImageRadius, backgroundImage: imageProvider,)
                      ),
                      gap4,
                      Expanded(
                        child: Text(
                          news.authorName,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                                overflow: TextOverflow.ellipsis,
                              ),
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 2,
                      ),
                      gap4,
                      Text(
                        DateFactory.formatDate(news.publishedDate),
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
