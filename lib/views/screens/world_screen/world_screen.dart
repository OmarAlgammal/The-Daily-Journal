import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/constance/padding/padding.dart';
import 'package:the_daily_journal/views/screens/world_screen/components/girde_view_discover_world_screen.dart';

import 'components/app_bar_world_screen.dart';

class WorldScreen extends StatelessWidget {
  const WorldScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWorldScreen(),
      body: Padding(
        padding: padding16,
        child: GridViewDiscoverWorld(),
      ),
    );
  }
}
