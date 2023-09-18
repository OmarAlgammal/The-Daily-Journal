import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/constance/icons.dart';
import 'package:the_daily_journal/utils/extensions/screen_dimens.dart';
import 'package:the_daily_journal/utils/helpers/date_factory.dart';
import 'package:the_daily_journal/view_model/bookmarks_cubit/bookmark_cubit.dart';
import 'package:the_daily_journal/views/widgets/my_cached_image_network.dart';

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
              child: MyCachedImageNetwork(
                url: news.imageUrl,
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
                            bookmarkIcon,
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
                      CircleAvatar(
                        radius: authorImageRadius,
                        child: MyCachedImageNetwork(
                          url: news.authorImageUrl,
                          itemBuilder: (context, ImageProvider imageProvider) =>
                              CircleAvatar(
                            radius: authorImageRadius,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.red, BlendMode.colorBurn)),
                              ),
                            ),
                          ),
                        ),
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
