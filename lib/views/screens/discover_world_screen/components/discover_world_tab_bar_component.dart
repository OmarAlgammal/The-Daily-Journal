import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_daily_journal/utils/constance/gaps.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';
import 'package:the_daily_journal/utils/enums/news_categories.dart';
import 'package:the_daily_journal/views/screens/discover_world_screen/components/discover_world_serach_box_component.dart';

class DiscoverWorldTabBarComponent extends StatelessWidget {
  DiscoverWorldTabBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gap24,
        Padding(
          padding: paddingH16,
          child: Column(
            children: [
              Text(
                'Discover',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
              Text('News from all around the world',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
            ],
          ),
        ),
        gap24,
        const DiscoverWorldSearchBoxComponent(),
        gap16,
        TabBar(
          isScrollable: true,
          onTap: (index) {
            Provider.of<ChipController>(context, listen: false)
                .changeChipIndex(index);
          },
          padding: paddingH16,
          labelPadding: paddingH4,
          indicatorColor: Colors.transparent,
          tabs: List.generate(
            NewsCategories.values.length,
            (index) => Tab(
              child: Consumer<ChipController>(
                builder: (context, model, child) => Chip(
                  label: Padding(
                    padding: paddingH4,
                    child: Text(
                      NewsCategories.values[index].name,
                      style: TextStyle(
                        color: model.chipIndex == index
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  backgroundColor: model.chipIndex == index ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ChipController with ChangeNotifier {
  /// TODO: Refactor chip controller
  int _chipIndex = 0;

  int get chipIndex => _chipIndex;

  void changeChipIndex(int index) {
    _chipIndex = index;
    notifyListeners();
  }
}
