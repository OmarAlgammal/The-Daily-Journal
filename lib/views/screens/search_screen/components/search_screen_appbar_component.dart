import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/enums/news_categories.dart';

import '../../../../utils/constance/gaps.dart';
import '../../../../utils/constance/icons.dart';
import '../../../../view_model/news_cubit/news_cubit.dart';
import '../../../widgets/circular_icon.dart';

class SearchScreenAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  SearchScreenAppBarComponent({Key? key}) : super(key: key);

  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 72,
      leading: Row(
        children: [
          gap16,
          CircularIcon(
            onTap: () {
              Navigator.pop(context);
            },
            icon: arrowLeftIcon,
          ),
        ],
      ),
      title: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'Search articles',
                  hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                  border: InputBorder.none),
              onSubmitted: (query) {
                NewsCubit.instance(context).fetchNewsByCategory(
                    category: NewsCategories.search, query: query);
              },
            ),
          ),
          PopupMenuButton(
            child: const CircularIcon(
              icon: filterIcon,
            ),
            itemBuilder: (context) => [
              'Popularity',
              'Relevancy',
            ]
                .map(
                  (sort) => PopupMenuItem(
                    child: Text(sort),
                    onTap: () {
                      debugPrint('sort here is $sort');
                      NewsCubit.instance(context).fetchNewsByCategory(
                          category: NewsCategories.search,
                          query: _controller.text,
                          sort: sort.toLowerCase());
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(12.0),
        child: Divider(
          thickness: 2,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
