import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/extensions/context_extension.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  const MyCircularProgressIndicator({Key? key, this.dimens}) : super(key: key);

  final double? dimens;
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimens ?? 24,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
