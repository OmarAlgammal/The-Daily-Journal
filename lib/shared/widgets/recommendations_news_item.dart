import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_daily_journal/utils/extensions/screen_dimens.dart';

import '../../features/home/domain/entities/news.dart';
import '../constance/gaps.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key, required this.news}) : super(key: key);

  final News news;

  /// height: 108, width: 112
  @override
  Widget build(BuildContext context) {
    debugPrint('height is ${context.screenHeight()} and width is ${context.screenWidth()}');
    return SizedBox(
      height: context.screenHeight() / 7.2,
      width: context.screenWidth() / 7,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              news.imageUrl,
              fit: BoxFit.cover,
              height: 108,
              width: 112,
            ),
          ),
          gap12,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // category
                Text(news.category, style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.grey,
                ),),
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
                      radius: 11,
                      backgroundImage: NetworkImage(
                        news.authorImageUrl,
                      ),
                    ),
                    gap4,
                    Text(news.authorName, style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey
                    ),),
                    const Spacer(),
                    const CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 2,
                    ),
                    gap4,
                    Text(
                        DateFormat.MMMd().add_y().format(DateTime.now()).toString(), style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey
                    ),),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
