import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/enums/news_categories.dart';
import 'package:the_daily_journal/views/widgets/news_list.dart';

import '../../../view_model/news_cubit/news_cubit.dart';

class HotIssueScreen extends StatelessWidget {
  const HotIssueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)!.settings.arguments as NewsCategories;
    NewsCubit.instance(context).fetchNewsByCategory(category: category);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: NewsList(
        category: category,
      ),
    );
  }
}
