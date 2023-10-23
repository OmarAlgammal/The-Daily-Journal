import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_daily_journal/utils/constance/gaps.dart';
import 'package:the_daily_journal/utils/constance/icons.dart';
import 'package:the_daily_journal/utils/enums/news_categories.dart';
import 'package:the_daily_journal/views/widgets/circular_icon.dart';

import '../../../view_model/chip_controller_provider.dart';
import '../categories_screen/categories_screen.dart';
import 'components/discover_world_tab_bar_component.dart';

class DiscoverWorldScreen extends StatelessWidget {
  DiscoverWorldScreen({Key? key}) : super(key: key);

  final tabs = NewsCategories.categories();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: ChangeNotifierProvider(
        create: (context) => ChipController(tabs: tabs),
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
                        icon: AppIcons.arrowLeftIcon,
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
              children:
                  tabs.map((category) => CategoryScreen(category)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
