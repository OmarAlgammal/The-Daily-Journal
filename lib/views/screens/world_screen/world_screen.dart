import 'package:flutter/material.dart';

class WorldScreen extends StatelessWidget {
  const WorldScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text.rich(
          TextSpan(
            text: 'Stay tuned',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
            children: [
              TextSpan(text: '\n  coming soon', style: Theme.of(context).textTheme.headlineMedium),
            ]
          ),
        ),
      ),
    );
  }
}
