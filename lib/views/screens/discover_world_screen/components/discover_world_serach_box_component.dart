import 'package:flutter/material.dart';
import 'package:the_daily_journal/routing/routes.dart';
import 'package:the_daily_journal/utils/constance/border_radius.dart';
import 'package:the_daily_journal/utils/constance/icons.dart';
import 'package:the_daily_journal/utils/constance/padding/padding.dart';

class DiscoverWorldSearchBoxComponent extends StatelessWidget {
  const DiscoverWorldSearchBoxComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingH16,
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, AppRouts.searchScreen);
        },
        child: TextField(
          decoration: InputDecoration(
            enabled:false,
            contentPadding: padding8,
            fillColor: Theme.of(context).colorScheme.surface,
            filled: true,
            prefixIcon: const Icon(AppIcons.searchIcon),
            suffixIcon: const Icon(AppIcons.filterIcon),
            border: const OutlineInputBorder(
              borderRadius: circularMax,
              borderSide: BorderSide.none,
            ),
            hintText: 'Search',
            hintStyle: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
