import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_daily_journal/utils/constance/gaps.dart';
import 'package:the_daily_journal/utils/constance/icons.dart';
import 'package:the_daily_journal/utils/enums/news_categories.dart';
import 'package:the_daily_journal/views/widgets/circular_icon.dart';

import '../../../models/news_model.dart';
import '../all_news_screen/category_screen.dart';
import 'components/discover_world_tab_bar_component.dart';

class DiscoverWorldScreen extends StatelessWidget {
  DiscoverWorldScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: NewsCategories.values.length,
      child: ChangeNotifierProvider(
        create: (context) => ChipController(),
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  toolbarHeight: 110,
                  floating: true,

                  /// TODO: Refactor leading width
                  leadingWidth: 100,
                  leading: Row(
                    children: [
                      gap16,
                      CircularIcon(
                        icon: arrowLeftIcon,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  snap: true,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(160),
                    child: DiscoverWorldTabBarComponent(),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: NewsCategories.values
                  .map((category) => CategoryScreen(category))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  /// Dummy data
  final List<NewsModel> news = [];
}
