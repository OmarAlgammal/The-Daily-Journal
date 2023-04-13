import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/constance/gaps.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';

class ChipsBarComponent extends StatefulWidget {
  const ChipsBarComponent({Key? key}) : super(key: key);

  @override
  State<ChipsBarComponent> createState() => _ChipsBarComponentState();
}

class _ChipsBarComponentState extends State<ChipsBarComponent> {
  late List<String> _choices;
  late int _choiceIndex;

  @override
  void initState() {
    _choices = ["All", 'Politic', "Sport", 'Education',];
    _choiceIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(36.0),
      child: ListView.separated(
        itemCount: _choices.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => gap8,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              if (index == 0)
                gap16,
              ChoiceChip(
                padding: padding8,
                label: Text(
                  _choices[index],
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: index == _choiceIndex
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                selected: _choiceIndex == index,
                selectedColor: Theme.of(context).colorScheme.primary,
                onSelected: (bool selected) {
                  setState(() {
                    _choiceIndex = selected ? index : 0;
                  });
                },
                backgroundColor: Theme.of(context).colorScheme.surface,
                labelStyle: TextStyle(color: Colors.white),
              ),
            ],
          );
        },
      ),
    );
  }
}
