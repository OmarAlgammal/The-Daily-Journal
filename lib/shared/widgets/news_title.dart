import 'package:flutter/material.dart';
import 'package:the_daily_journal/shared/constance/colors.dart';

class NewsTitle extends StatelessWidget {
  const NewsTitle({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.w500
        ),),
        Text('View all', style: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.bold,
          color: brightBlueColor,
        ),)
      ],
    );
  }
}
