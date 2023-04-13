import 'package:flutter/material.dart';

import '../../../../utils/constance/padding.dart';

class ViewAllNewsDescriptionComonent extends StatelessWidget {
  const ViewAllNewsDescriptionComonent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface)),
        ],
      ),
    );
  }
}
