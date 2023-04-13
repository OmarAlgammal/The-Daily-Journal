import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/constance/border_radius.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.onPressed, required this.buttonName})
      : super(key: key);

  final VoidCallback onPressed;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(borderRadius: circular8)),
        fixedSize: MaterialStateProperty.all<Size>(
          /// TODO: Refactor this
          const Size(double.maxFinite, 56.0),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.primary,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonName,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}
