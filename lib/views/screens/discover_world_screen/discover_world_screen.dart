import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_daily_journal/utils/constance/gaps.dart';
import 'package:the_daily_journal/utils/constance/icons.dart';
import 'package:the_daily_journal/views/screens/BussinessScreen/business_screen.dart';
import 'package:the_daily_journal/views/screens/Entertainment/entertainment_screen.dart';
import 'package:the_daily_journal/views/screens/all_news_screen/all_news_screen.dart';
import 'package:the_daily_journal/views/screens/discover_world_screen/components/discover_world_tab_bar_component.dart';
import 'package:the_daily_journal/views/screens/egypt_news_screen/egypt_news_screen.dart';
import 'package:the_daily_journal/views/screens/general_news_screen/general_news_screen.dart';
import 'package:the_daily_journal/views/screens/health_screen/health_screen.dart';
import 'package:the_daily_journal/views/screens/science_screen/science_screen.dart';
import 'package:the_daily_journal/views/screens/sports_screen/sports_screen.dart';
import 'package:the_daily_journal/views/screens/technology_screen/technology_screen.dart';
import 'package:the_daily_journal/views/widgets/circular_icon.dart';

import '../../../models/news_model.dart';

class DiscoverWorldScreen extends StatelessWidget {
  DiscoverWorldScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
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
                    preferredSize: Size.fromHeight(160),
                    child: DiscoverWorldTabBarComponent(),
                  ),
                ),
              ];
            },
            body: const TabBarView(
              children: [
                AllNewsScreen(),
                BusinessScreen(),
                EntertainmentScreen(),
                ScienceScreen(),
                SportsScreen(),
                HealthScreen(),
                TechnologyScreen(),
                EgyptNewsScreen(),
                GeneralNewsScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Dummy data
  final List<NewsModel> news = [];
}
