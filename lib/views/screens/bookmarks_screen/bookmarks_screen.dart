import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:the_daily_journal/repositories/local_repository.dart';
import 'package:the_daily_journal/utils/constance/padding/padding.dart';

import '../../../models/news_model.dart';
import '../../../services_locator/services_locator.dart';
import '../../../utils/constance/gaps.dart';
import '../../../utils/constance/icons.dart';
import '../../../utils/theme/colors.dart';
import '../../widgets/circular_icon.dart';
import '../../widgets/news_item.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmarks',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          CircularIcon(
              icon: AppIcons.searchIcon,
              onTap: () {
                /// TODO: Complete this action
              }),
          gap8,
        ],
      ),
      body: ValueListenableBuilder<Box<NewsModel>>(
        valueListenable: sl<LocalDatabase>().getBookmarksBox().listenable(),
        builder: (context, box, _) {
          final news = box.values.toList().cast<NewsModel>();
          if (news.isEmpty) {
            return Center(
              child: Text(
                'No saved bookmarks',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          }
          return ListView.separated(
            padding: padding16,
            itemCount: news.length,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const Column(
              children: [
                gap8,
                Divider(
                  color: brightGreyColor,
                  height: 2,
                  thickness: 2,
                ),
                gap8,
              ],
            ),
            itemBuilder: (context, index) => NewsItem(
              news: news[index],
              showBookmark: true,
            ),
          );
        },
      ),
    );
  }
}
