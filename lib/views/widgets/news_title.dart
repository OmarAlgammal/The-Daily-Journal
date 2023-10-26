import 'package:flutter/material.dart';
import 'package:the_daily_journal/routing/routes.dart';
import 'package:the_daily_journal/utils/constance/padding/app_padding.dart';

class NewsTitle extends StatelessWidget {
  const NewsTitle({
    Key? key,
    required this.title,
    this.showButton = true,
    this.usePadding = true,
  }) : super(key: key);

  final String title;
  final bool showButton;
  final bool usePadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: usePadding ? AppPadding.screenPadding : EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          if (showButton)
            TextButton(
              child: Text(
                'View all',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(AppRouts.discoverWorldScreen);
              },
            )
        ],
      ),
    );
  }
}
