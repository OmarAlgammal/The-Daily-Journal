import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/constance/border_radius.dart';
import 'package:the_daily_journal/utils/constance/icons.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';

class SearchBoxComponent extends StatelessWidget {
  const SearchBoxComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingH16,
      child: TextField(
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.surface,
          filled: true,
          prefixIcon: const Icon(searchIcon),
          suffixIcon: const Icon(filterIcon),
          border: const OutlineInputBorder(
            borderRadius: circularMax,
            borderSide: BorderSide.none,
          ),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
