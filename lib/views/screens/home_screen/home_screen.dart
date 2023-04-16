import 'package:flutter/material.dart';

import '../../../models/news_model.dart';
import '../../../utils/constance/gaps.dart';
import 'components/breaking_news_component.dart';
import 'components/home_app_bar_component.dart';
import 'components/recommendations_news_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBarComponent(),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            BreakingNewsComponent(
            ),
            gap12,
            RecommendationsNewsComponent(),
          ],
        ),
      ),
    );
  }
}
