import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/constance/gaps.dart';
import 'package:the_daily_journal/view_model/news_cubit/news_cubit.dart';

class FollowUpScreen extends StatelessWidget {
  const FollowUpScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    //NewsCubit.instance(context).fetchNewsByCategory(category: category);
    final String title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.separated(
          itemBuilder: (contest, index) => const SizedBox(),
          separatorBuilder: (context, index) => gap12,
          itemCount: 3),
    );
  }
}
