import 'package:flutter/material.dart';
import 'package:the_daily_journal/models/news_model.dart';
import 'package:the_daily_journal/views/widgets/my_cached_image_network.dart';

import '../../../../utils/constance/gaps.dart';
import '../../../widgets/authentication_mark.dart';

class SliverListComponent extends StatelessWidget {
  const SliverListComponent({Key? key, required this.news}) : super(key: key);

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      child: MyCachedImageNetwork(url: news.imageUrl),
                    ),
                    gap8,
                    Text(
                      news.sourceName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    gap4,
                    const AuthenticationMark(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      news.description,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    gap12,
                    Text(
                      news.content,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
